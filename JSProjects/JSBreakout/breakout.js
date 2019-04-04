//game parameters
const BALL_SPEED = 0.5; // starting ball speed as a fraction of screen height per second
const BALL_SPIN = 0.1; // ball deflection of paddle (0 = no spin, 1 = high spin)
const BRICK_COLS = 14; // starting number of brick columns
const BRICK_GAP = 0.3; // brick gap as a fraction of wall
const BRICK_ROWS = 8; // starting number of brick rows
const GAME_LIVES = 3; // starting number of lives
const KEY_SCORE = "highscore"; //save key for local storage of high score
const MARGIN = 6; // number of empty rows at the top
const MAX_LEVEL = 2; // maximum game level
const MIN_BOUNCE_ANGLE = 30; // minimum bounce angle from the horizon
const PADDLE_WIDTH = 0.1; // paddle width as a multiple of wall thickness
const PADDLE_SIZE = 1.25; // paddle size as a fraction of wall thickness
const PADDLE_SPEED = 0.5; // fraction of screen per second
const PUP_BONUS = 50; // bonus points for collecting extra powerup
const PUP_CHANCE = 1; // probability of a powerup will occur with hit
const PUP_SPEED = 0.15; // power up speed as a fraction of screen height per second

const WALL = 0.02; // wall / ball size as a fraction of the shortest

// colors
const COLOR_BACKGROUND = "black";
const COLOR_BALL = "white";
const COLOR_PADDLE = "white";
const COLOR_TEXT = "white";
const COLOR_WALL = "grey";

// text
const TEXT_FONT = "Lucida Console";
const TEXT_GAME_OVER = "GAME OVER!";
const TEXT_LEVEL = "Level";
const TEXT_LIVES = "Ball";
const TEXT_SCORE = "Score";
const TEXT_SCORE_HIGH = "High Score";
const TEXT_WIN = "*** YOU WIN! ***";

//definitions
const Direction = {
  LEFT: 0,
  RIGHT: 1,
  STOP: 2
};

const PupType = {
  EXTENSION: { color: "dodgerblue", symbol: "=" },
  LIFE: { color: "hotpink", symbol: "+" },
  STICKY: { color: "aqua", symbol: "~" },
  MULTI: { color: "magenta", symbol: "*" }
};

// set up game canvas and context
var canvas = document.createElement("canvas");
document.body.appendChild(canvas);
var context = canvas.getContext("2d");

// set up sound effects
var fxBrick = new Audio("sounds/brick.m4a");
var fxPaddle = new Audio("sounds/paddle.m4a");
var fxPowerup = new Audio("sounds/powerup.m4a");
var fxWall = new Audio("sounds/wall.m4a");

// game variables
var startMessage = "Press Spacebar to Start!";
var ball1, paddle, ball2;
var bricks = [],
  pups = [];
var gameOver, win;
var pupExtension, pupSticky, pupMulti, pupCount;
var level, lives, score;
var scoreHigh;
var hitCount = 0;
var textSize;
var numBricks;
var powerUp = ["multiBall", "widePaddle", "catch"];

// dimensions
var width, height, wall;
setDimensions();

// event listener
document.addEventListener("keydown", keyDown);
document.addEventListener("keyup", keyUp);
window.addEventListener("resize", setDimensions);

//set up the game loop
var timeDelta, timeLast;
requestAnimationFrame(loop);

// game loop
function loop(timeNow) {
  if (!timeLast) {
    timeLast = timeNow;
  }

  // calculate the time difference
  timeDelta = (timeNow - timeLast) / 1000;
  timeLast = timeNow;

  // update
  if (!gameOver) {
    updatePaddle(ball, timeDelta);
    updateBall(ball, timeDelta);
    if (pupMulti) {
      updateBall(ball2, timeDelta);
    }
    updateBricks(ball, timeDelta);
    if (pupMulti) {
      updateBricks(ball2, timeDelta);
    }
    updatePups(timeDelta);
  }

  // draw
  drawBackground();
  drawWalls();
  drawPups();
  drawPaddle();
  drawBricks();
  drawText();
  drawBall();

  // call the next loop
  requestAnimationFrame(loop);
}

// modifies ball speed and direction
function applyBallSpeed(ball, angle) {
  ball.xv = ball.speed * Math.cos(angle);
  ball.yv = -ball.speed * Math.sin(angle);
}

// create and populate brick table
function createBricks() {
  //row dimensions
  let minY = wall;
  let maxY = ball.y - ball.height * 3.5;
  let totalSpaceY = maxY - minY;
  let totalRows = MARGIN + BRICK_ROWS + 10 * 2;
  let rowHeight = totalSpaceY / totalRows;
  let gap = wall * BRICK_GAP;
  let brick_height = rowHeight - gap;
  textSize = (rowHeight * MARGIN) / 2;

  //column dimension
  let totalSpaceX = width - wall * 2;
  let columnWidth = (totalSpaceX - gap) / BRICK_COLS;
  let brick_width = columnWidth - gap;

  //populate the bricks array
  bricks = [];
  let cols = BRICK_COLS;
  let rows = BRICK_ROWS + level * 2;
  let color, left, score, top;
  numBricks = cols * rows;
  for (let i = 0; i < rows; i++) {
    bricks[i] = [];
    color = getBrickColor(i);
    score = getBrickScore(color);
    top = wall + (MARGIN + i) * rowHeight;
    for (let j = 0; j < cols; j++) {
      left = wall + gap + j * columnWidth;
      bricks[i][j] = new Brick(
        left,
        top,
        brick_width,
        brick_height,
        color,
        score
      );
    }
  }
}

// draws background
function drawBackground() {
  context.fillStyle = COLOR_BACKGROUND;
  context.fillRect(0, 0, canvas.width, canvas.height);
}

// draws game paddle
function drawPaddle() {
  context.fillStyle = pupSticky ? PupType.STICKY.color : COLOR_PADDLE;
  context.fillRect(
    paddle.x - paddle.width / 2,
    paddle.y - paddle.height / 2,
    paddle.width,
    paddle.height
  );
}

// draws Power Ups
function drawPups() {
  context.lineWidth = wall * 0.35;
  for (let pup of pups) {
    context.fillStyle = pup.type.color;
    context.strokeStyle = pup.type.color;
    context.strokeRect(
      pup.x - pup.width / 2,
      pup.y - pup.height / 2,
      pup.width,
      pup.height
    );
    context.font = "bold " + pup.height + "px " + TEXT_FONT;
    context.textAlign = "center";
    context.fillText(pup.type.symbol, pup.x, pup.y);
  }
}

// draws game text, Score, Level, Lives, Powerup
function drawText() {
  context.fillStyle = COLOR_TEXT;

  // dimensions
  let labelSize = textSize * 0.5;
  let margin = wall * 2;
  let maxWidth = width - margin * 2;
  let maxWidth1 = maxWidth * 0.27;
  let maxWidth2 = maxWidth * 0.2;
  let maxWidth3 = maxWidth * 0.2;
  let maxWidth4 = maxWidth * 0.27;
  let x1 = margin;
  let x2 = width * 0.4;
  let x3 = width * 0.6;
  let x4 = width - margin;
  let yLabel = wall + labelSize;
  let yValue = yLabel + textSize * 0.9;

  // labels
  context.font = labelSize + "px " + TEXT_FONT;
  context.textAlign = "left";
  context.fillText(TEXT_SCORE, x1, yLabel, maxWidth1);
  context.textAlign = "center";
  context.fillText(TEXT_LIVES, x2, yLabel, maxWidth2);
  context.textAlign = "center";
  context.fillText(TEXT_LEVEL, x3, yLabel, maxWidth3);
  context.textAlign = "right";
  context.fillText(TEXT_SCORE_HIGH, x4, yLabel, maxWidth4);

  // values
  context.font = textSize + "px " + TEXT_FONT;
  context.textAlign = "left";
  context.fillText(score, x1, yValue, maxWidth1);
  context.textAlign = "center";
  context.fillText(lives + "/" + GAME_LIVES, x2, yValue, maxWidth2);
  context.textAlign = "center";
  context.fillText(level, x3, yValue, maxWidth3);
  context.textAlign = "right";
  context.fillText(scoreHigh, x4, yValue, maxWidth4);

  // game over
  if (gameOver || (ball.yv == 0 && !pupSticky)) {
    if (gameOver) {
      let text = win ? TEXT_WIN : TEXT_GAME_OVER;
      context.font = textSize + "px " + TEXT_FONT;
      context.textAlign = "center";
      context.fillText(
        TEXT_GAME_OVER,
        width / 2,
        paddle.y - textSize,
        maxWidth1
      );
    }
    context.textAlign = "center";
    context.fillText(
      "Press Spacebar to Serve!",
      width / 2,
      height / 2,
      maxWidth1 * 2
    );
    context.font = textSize / 2 + "px " + TEXT_FONT;
    context.textAlign = "center";
    context.fillText(
      "<~ or ~> Moves the Paddle",
      width / 2,
      height / 2 - textSize,
      maxWidth1 * 2
    );
  }
}

// draws ball
function drawBall() {
  context.fillStyle = COLOR_BALL;
  context.fillRect(
    ball.x - ball.width / 2,
    ball.y - ball.height / 2,
    ball.width,
    ball.height
  );
  if (ball2) {
    context.fillStyle = PupType.MULTI.color;
    context.fillRect(
      ball2.x - ball.width / 2,
      ball2.y - ball.height / 2,
      ball.width,
      ball.height
    );
  }
}

// draws brick tables
function drawBricks() {
  for (let row of bricks) {
    for (let brick of row) {
      if (brick == null) {
        continue;
      }
      context.fillStyle = brick.color;
      context.fillRect(brick.left, brick.top, brick.width, brick.height);
    }
  }
}

// draws boundary walls game window
function drawWalls() {
  var halfWall = wall * 0.5;
  context.lineWidth = wall;
  context.strokeStyle = COLOR_WALL;
  context.beginPath();
  context.moveTo(halfWall, height);
  context.lineTo(halfWall, halfWall);
  context.lineTo(width - halfWall, halfWall);
  context.lineTo(width - halfWall, height);
  context.stroke();
}

// sets brick color during creation based on row
function getBrickColor(row) {
  switch (row) {
    case 0:
    case 1:
      return "red";
    case 2:
    case 3:
      return "darkorange";
    case 4:
    case 5:
      return "lime";
    case 6:
    case 7:
      return "yellow";
  }
}

// sets score for bricks based on color
function getBrickScore(color) {
  switch (color) {
    case "red":
      return 7;
    case "darkorange":
      return 5;
    case "lime":
      return 3;
    case "yellow":
      return 1;
  }
}

// listens for key down event to move paddle or serve the ball
function keyDown(event) {
  switch (event.keyCode) {
    case 32: //spacebar
      serve(ball);
      if (gameOver) {
        newGame();
      }
      break;
    case 37: //left arrow
      movePaddle(Direction.LEFT);
      break;
    case 39: //right arrow
      movePaddle(Direction.RIGHT);
      break;
  }
}

// listens for key up event to stop paddle
function keyUp(event) {
  switch (event.keyCode) {
    case 37:
    case 39:
      movePaddle(Direction.STOP);
      break;
  }
}

// controls paddle movement along the x axis
function movePaddle(direction) {
  switch (direction) {
    case Direction.LEFT:
      paddle.xv = -paddle.speed;
      break;
    case Direction.RIGHT:
      paddle.xv = paddle.speed;
      break;
    case Direction.STOP:
      paddle.xv = 0;
      break;
  }
}

// adds ball and paddle to game
function newBall() {
  pupExtension = false;
  pupSticky = false;
  pupMulti = false;
  ball2 = null;
  paddle = new Paddle();
  ball = new Ball();
}

// resets ball, paddle, level, and score
function newGame() {
  gameOver = false;
  level = 0;
  lives = GAME_LIVES;
  score = 0;
  win = false;

  // get high score
  let scoreStr = localStorage.getItem(KEY_SCORE);
  if (scoreStr == null) {
    scoreHigh = 0;
  } else {
    scoreHigh = parseInt(scoreStr);
  }

  // start a new level
  newLevel();
}

function newLevel() {
  pups = [];
  newBall();
  createBricks();
}

// tests to see if ball has fallen past paddle
// **update to clear bug with multiball
function outOfBounds(ball) {
  if (ball == ball2) {
    pupMulti = false;
    ball2 = null;
  } else if (ball == ball1) {
    ball1 = ball2;
    ball2 = null;
    pupMulti = false;
  } else {
    lives--;
    if (lives == 0) {
      gameOver = true;
    }
    newBall();
  }
}

// serves ball to start the game or on catch powerup
function serve(ball) {
  // ball already in motion
  if (ball.yv != 0) {
    return false;
  }

  // random angle (not less than min bounce angle)
  startMessage = "";
  let minBounceAngle = (MIN_BOUNCE_ANGLE / 180) * Math.PI;
  let range = Math.PI - minBounceAngle * 2;
  let angle = (Math.random() * Math.PI) / 2 + Math.PI / 4;
  applyBallSpeed(ball, pupSticky ? Math.PI / 2 : angle);
  fxPaddle.play();
  return true;
}

// create window dimension (allows window resizing)
function setDimensions() {
  width = window.innerWidth;
  height = window.innerHeight;
  wall = WALL * (height < width ? height : width);
  canvas.width = width;
  canvas.height = height;
  context.textBaseline = "middle";
  newGame();
}

// adds ball spin to modify direction after ball hits paddle.
// prevents game ball from traveling a predictable for every iteration
// of the game.
function spinBall() {
  let upwards = ball.yv < 0;
  // modify the angle based off of ball spin
  var angle = Math.atan2(-ball.yv, ball.xv);
  angle += (Math.random() * Math.PI) / 2 - (Math.PI / 4) * BALL_SPIN;

  // minimum bounce angle
  let minBounceAngle = (MIN_BOUNCE_ANGLE / 180) * Math.PI;
  if (upwards) {
    if (angle < minBounceAngle) {
      angle = minBounceAngle;
    } else if (angle > Math.PI - minBounceAngle) {
      angle = Math.PI - minBounceAngle;
    }
  } else {
    if (angle > -minBounceAngle) {
      angle = -minBounceAngle;
    } else if (angle < -Math.PI + minBounceAngle) {
      angle = -Math.PI + minBounceAngle;
    }
  }
  applyBallSpeed(ball, angle);
}

// modifies ball location throughout game play
function updateBall(ball, delta) {
  ball.x += ball.xv * delta;
  ball.y += ball.yv * delta;

  // bounce ball off walls
  if (ball.x < wall + ball.width / 2) {
    ball.x = wall + ball.width / 2;
    ball.xv = -ball.xv;
    fxWall.play();
  } else if (ball.x > canvas.width - wall - ball.width / 2) {
    ball.x = canvas.width - wall - ball.width / 2;
    ball.xv = -ball.xv;
    fxWall.play();
  } else if (ball.y < wall + ball.height / 2) {
    ball.y = wall + ball.height / 2;
    ball.yv = -ball.yv;
    fxWall.play();
  }

  // handle out of bounds
  if (ball.y > canvas.height) {
    outOfBounds(ball);
  }

  // bounce off the paddle
  if (
    ball.y > paddle.y - paddle.height / 2 - ball.height / 2 &&
    ball.y < paddle.y + paddle.height / 2 &&
    ball.x > paddle.x - paddle.width / 2 - ball.width / 2 &&
    ball.x <= paddle.x + paddle.width / 2 + ball.width / 2
  ) {
    ball.y = paddle.y - paddle.height / 2 - ball.height / 2;
    if (pupSticky) {
      ball.xv = 0;
      ball.yv = 0;
    } else {
      ball.yv = -ball.yv;
      spinBall();
    }
    fxPaddle.play();
  }
}

// modifies brick array and removes bricks after ball collision
function updateBricks(ball, delta) {
  // check for ball collisions
  OUTER: for (let i = 0; i < bricks.length; i++) {
    for (let j = 0; j < BRICK_COLS; j++) {
      if (bricks[i][j] != null && bricks[i][j].intersect(ball)) {
        updateScore(bricks[i][j].score);
        hitCount++;
        pupCount++;
        updateSpeed(bricks[i][j].color);

        // set ball to the edge of the brick
        if (ball.yv < 0) {
          ball.y = bricks[i][j].bottom + ball.height / 2;
        } else {
          ball.y = bricks[i][j].top - ball.height / 2;
        }

        // create a powerup
        if (Math.random() <= PUP_CHANCE) {
          let px = bricks[i][j].left + bricks[i][j].width / 2;
          let py = bricks[i][j].top + bricks[i][j].height / 2;
          let pSize = bricks[i][j].width / 2;
          let pKeys = Object.keys(PupType);
          let pKey = pKeys[Math.floor(Math.random() * pKeys.length)];
          pups.push(new PowerUp(px, py, pSize, PupType[pKey]));
        }

        // bounce the ball and destroy the brick
        bricks[i][j] = null;
        ball.yv = -ball.yv;
        numBricks--;
        fxBrick.play();
        break OUTER;
      }
    }
  }

  // next level
  if (numBricks == 0) {
    if (level < MAX_LEVEL) {
      level++;
      newLevel();
    } else {
      gameOver = true;
      win = true;
      newBall();
    }
  }
}

// move the paddle
function updatePaddle(ball, delta) {
  let lastPaddleX = paddle.x;
  paddle.x += paddle.xv * delta;

  // stop paddle at walls
  if (paddle.x < wall + paddle.width / 2) {
    paddle.x = wall + paddle.width / 2;
  } else if (paddle.x > canvas.width - wall - paddle.width / 2) {
    paddle.x = canvas.width - wall - paddle.width / 2;
  }

  // move the stationary ball with the paddle
  if (ball.yv == 0) {
    ball.x += paddle.x - lastPaddleX;
  }

  // collect power ups
  for (let i = pups.length - 1; i >= 0; i--) {
    if (
      pups[i].x + pups[i].width / 2 > paddle.x - paddle.width / 2 &&
      pups[i].x - pups[i].width / 2 < paddle.x + paddle.width / 2 &&
      pups[i].y + pups[i].height / 2 > paddle.y - paddle.height / 2 &&
      pups[i].y - pups[i].height / 2 < paddle.y + paddle.height / 2
    ) {
      switch (pups[i].type) {
        case PupType.EXTENSION:
          // double paddle width
          if (pupExtension) {
            score += PUP_BONUS;
          } else {
            pupExtension = true;
            pupSticky = false;
            paddle.width *= 2;
            pupCount = 0;
          }
          break;
        case PupType.LIFE:
          // extra life
          lives++;
          break;
        case PupType.STICKY:
          // catch ball
          if (pupSticky) {
            score += PUP_BONUS;
          } else {
            pupSticky = true;
            if (pupExtension) {
              paddle.width /= 2;
              pupExtension = false;
            }
            pupCount = 0;
          }
          break;
        case PupType.MULTI:
          // add a ball
          if (pupMulti) {
            score += PUP_BONUS;
          } else {
            pupMulti = true;
            pupSticky = false;
            ball.vy = BALL_SPEED * height;
            ball2 = new Ball();
            ball2.x = width / 2;
            ball2.y = height / 2;
            ball2.vx = 0;
            ball2.vy = BALL_SPEED * height;
            serve(ball2);
          }
          break;
      }
      pups.splice(i, 1);
      fxPowerup.play();
    }
  }

  // lose power up
  if (pupCount == 4) {
    pupCount = 0;
    if (pupExtension) {
      paddle.width /= 2;
      pupExtension = false;
    }
    pupSticky = false;
  }
}

// drops Power Ups
function updatePups(delta) {
  for (let i = pups.length - 1; i >= 0; i--) {
    pups[i].y += pups[i].yv * delta;

    // delete off-screen pups
    if (pups[i] - pups[i].height / 2 > height) {
      pups.splice(i, 1);
    }
  }
}

// modifies game score
function updateScore(brickScore) {
  score += brickScore;

  if (score > scoreHigh) {
    scoreHigh = score;
    localStorage.setItem(KEY_SCORE, scoreHigh);
  }
}

// update speed increases game difficulty by increasing ball velocity
// at specific intervals / events
function updateSpeed(color) {
  if (
    hitCount == 4 ||
    hitCount == 12 ||
    color == "darkorange" ||
    color == "red"
  ) {
    ball.speed *= 1.025;
  }
}

// constructor function for ball
function Ball() {
  this.width = wall;
  this.height = wall;
  this.x = paddle.x;
  this.y = paddle.y - paddle.height / 2 - this.height / 2;
  this.xv = 0;
  this.yv = 0;
  this.speed = BALL_SPEED * height;
}

// constructor function for game bricks
function Brick(left, top, w, h, color, score) {
  this.width = w;
  this.height = h;
  this.bottom = top + h;
  this.left = left;
  this.right = left + w;
  this.top = top;
  this.color = color;
  this.score = score;

  this.intersect = function(ball) {
    let ballBottom = ball.y + ball.height / 2;
    let ballLeft = ball.x - ball.width / 2;
    let ballRight = ball.x + ball.width / 2;
    let ballTop = ball.y - ball.height / 2;
    return (
      this.left < ballRight &&
      ballLeft < this.right &&
      this.bottom > ballTop &&
      ballBottom > this.top
    );
  };
}

// constructor function for player paddle
function Paddle() {
  this.width = PADDLE_WIDTH * width;
  this.height = wall * PADDLE_SIZE;
  this.x = canvas.width / 2;
  this.y = canvas.height - wall * 3.5 + this.height / 2;
  this.xv = 0;
  this.speed = PADDLE_SPEED * width;
}

// Powerups
function PowerUp(x, y, size, type) {
  this.width = size;
  this.height = size;
  this.x = x;
  this.y = y;
  this.type = type;
  this.yv = PUP_SPEED * height;
}

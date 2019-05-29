import { BoardPiece, BoardBase } from '../board'
import { Player } from '../player'

export abstract class GameBase {
  board: BoardBase
  players: Array<Player>
  currentPlayerId: number
  isMoveAllowed: boolean = false
  isGameWon: boolean = false

  constructor(players: Array<Player>, board: BoardBase) {
    this.board = board
    this.players = players
    this.currentPlayerId = 0
    this.reset()
  }
  reset() {
    this.isMoveAllowed = false
    this.isGameWon = false
    this.board.reset()
    this.board.debug()
  }

  async start() {
    this.isMoveAllowed = true
    while (!this.isGameWon) {
      await this.move()
      const winner = this.board.getWinner()
      if (winner !== BoardPiece.EMPTY) {
        console.log('Game over: winner is player ', winner)
        this.isGameWon = true
        this.isMoveAllowed = false
        this.board.announceWinner()
        break
      }
    }
  }
  async move() {
    if (!this.isMoveAllowed) {
      return
    }
    const currentPlayer = this.players[this.currentPlayerId]
    let actionSuccesful = false
    while (!actionSuccesful) {
      const action = await currentPlayer.getAction(this.board)
      this.isMoveAllowed = false
      actionSuccesful = await this.board.applyPlayerAction(
        currentPlayer,
        action
      )
      this.isMoveAllowed = true
      if (!actionSuccesful) {
        console.log('Move not allowed! Try again.')
      } else {
        this.afterMove(action)
      }
    }
    this.currentPlayerId = this.getNextPlayer()
  }
  abstract afterMove(action: number): void

  private getNextPlayer() {
    return this.currentPlayerId === 0 ? 1 : 0
  }
}

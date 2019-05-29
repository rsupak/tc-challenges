import java.awt.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.LinkedList;

import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
/**
 * The Sliding Puzzle. Has the window and components the user interacts with.
 * 
 *
 */
public class SlidingPuzzle
{
	/**
	 * Struct-like class holding information about the current state of animation.
	 * 
	 *
	 */
	private class AState
	{	
		private LinkedList<Byte> path; // Path to solution. 
		private Timer timer; // Timer that will enable animation.
		private Location loc; // Location on grid of moving tile.
		
		private Point tilePos; // Position on panel tile is located.
		private Tile tile; // The tile itself.
		
		private Byte dir; // Direction of move.
		
		private boolean finish; // Determines if animation is finished.
		
		// Goal x and y values.
		private int gx;
		private int gy;
		
		private double animation; // Progress of animation.
		private double rate; // Speed of progress update.
		
		private boolean skip;
		
		private AState()
		{
			path = null;
			timer = null;
			loc = null;
			tilePos = null;
			tile = null;
			dir = -1;
			finish = true;
			rate = Options.ARATE;
			skip = false;
		}
	}
	
	
	public static boolean inAnimation;
	
	// Window variables.
	private JFrame frame;
	private PuzzlePanel puzzleSpace;
	private JPanel buttonSpace;
	
	// For loading an image into a puzzle.
	private JFileChooser loader;
	
	// Main buttons.
	private JButton loaderButton;
	private JButton scrambler;
	private JButton solver;
	private JCheckBox skip;
	
	// Puzzle type buttons.
	private ButtonGroup puzzGroup;
	private JRadioButton puzzle8;
	private JRadioButton puzzle15;
	private JRadioButton puzzle24;
	
	// Animation variables.
	private JSlider animSpeed;
	private AState anim;
	
	/**
	 * Constructor for the class that provides frame with components and listeners. 
	 */
	public SlidingPuzzle()
	{
		// Set up the frame and initialize anim.
		frame = new JFrame("Sliding Puzzle");
		ImageIcon img = new ImageIcon("8 Puzzle.png");
		frame.setIconImage(img.getImage());
		
		inAnimation = false;
		anim = new AState();
		
		Container cp = frame.getContentPane();
		cp.setLayout(new BorderLayout(0,0));
		
		// Set up the puzzle space.
		puzzleSpace = new PuzzlePanel();
		cp.add(puzzleSpace, BorderLayout.CENTER);
		
		/*** MouseListener for puzzleSpace. ***/
		puzzleSpace.addMouseListener(new MouseListener() {
			@Override
			public void mouseClicked(MouseEvent event){}
			@Override
			public void mouseEntered(MouseEvent event){}
			
			/**
			 * On exit event remove highlight and repaint.
			 */
			@Override
			public void mouseExited(MouseEvent event)
			{
				if(inAnimation)
					return;
				
				puzzleSpace.unsetHighlight();
				puzzleSpace.repaint();
			}
			@Override
			public void mouseReleased(MouseEvent event){}
			
			/**
			 * On press event sets the emptyLoc of puzzleSpace. If
			 * emptyLoc is already set it will move the tile that was selected
			 * by the user.
			 */
			@Override
			public void mousePressed(MouseEvent event)
			{
				if(inAnimation)
					return;
				
				if(puzzleSpace.getEmptyLoc() == null)
				{
					puzzleSpace.setEmptyLoc(event.getPoint());
					puzzleSpace.setHighlight(event.getPoint());
					puzzleSpace.repaint();
				}
				else
				{
					if(puzzleSpace.playerMove(event.getPoint()))
					{
						if(puzzleSpace.goalCheck())
							puzzleSpace.resetEmpty();
					}
					puzzleSpace.setHighlight(event.getPoint());
					puzzleSpace.repaint();
				}
			}
		});
		
		puzzleSpace.addMouseMotionListener(new MouseMotionListener() {
			/**
			 * On a move event it will set the highlight to the position of
			 * the mouse.
			 */
			@Override
			public void mouseMoved(MouseEvent event)
			{
				if(inAnimation)
					return;
				
				puzzleSpace.setHighlight(event.getPoint());
				puzzleSpace.repaint();
			}
			@Override
			public void mouseDragged(MouseEvent event) {}
		});
		
		
		// Set up the button space.
		buttonSpace = new JPanel(new GridBagLayout());
		
		// Set up the "Load Image" button.
		GridBagConstraints loadc = new GridBagConstraints();
		loadc.fill = GridBagConstraints.HORIZONTAL;
		loadc.weightx = 0.5;
		loadc.gridx = 0;
		loadc.gridy = 0;
		
		loader = new JFileChooser();
		loaderButton = new JButton("Load Image");
		buttonSpace.add(loaderButton, loadc);
		loaderButton.addActionListener(new ActionListener() {
			
			/**
			 * On a button press loads an image using loader.
			 */
			@Override
			public void actionPerformed(ActionEvent event)
			{
				if(inAnimation)
					return;
				
				File file = null;
				int state = loader.showOpenDialog(null);
				if(state == JFileChooser.APPROVE_OPTION)
				{
					file = loader.getSelectedFile();
				}
				
				BufferedImage img = null;
				try 
				{
					if(file != null)
					{
						img = ImageIO.read(file);
						puzzleSpace.loadImage(img);
						puzzleSpace.repaint();
					}
				} catch (IOException e)
				{
					System.err.println("Failed to read file!");
				}
				
			}
		});
		
		// Set up "Scramble" button.
		GridBagConstraints scrambc = new GridBagConstraints();
		scrambc.fill = GridBagConstraints.HORIZONTAL;
		scrambc.weightx = 0.5;
		scrambc.gridx = 1;
		scrambc.gridy = 0;
		
		scrambler = new JButton("Scramble");
		buttonSpace.add(scrambler, scrambc);
		scrambler.addActionListener(new ActionListener() {
			/**
			 * On button press scramble the puzzle.
			 */
			@Override
			public void actionPerformed(ActionEvent event)
			{
				if(inAnimation)
					return;
				
				if(puzzleSpace.getImage() != null)
				{
					puzzleSpace.scramble();
					puzzleSpace.repaint();
				}
			}
		});
		
		// Set up the "Solve" button.
		GridBagConstraints solvec = new GridBagConstraints();
		solvec.fill = GridBagConstraints.HORIZONTAL;
		solvec.weightx = 0.5;
		solvec.gridx = 2;
	    solvec.gridy = 0;
		
		solver = new JButton("Solve");
		buttonSpace.add(solver, solvec);
		solver.addActionListener(new ActionListener() {
			/**
			 * Solve the puzzle then animate the solution.
			 */
			@Override
			public void actionPerformed(ActionEvent event)
			{
				if(inAnimation)
					return;
				SlidingPuzzle.inAnimation = true;
				
				JRadioButton buttons[] = new JRadioButton[3];
				buttons[0] = puzzle8;
				buttons[1] = puzzle15;
				buttons[2] = puzzle24;
				
				puzzle8.setEnabled(false);
				puzzle15.setEnabled(false);
				puzzle24.setEnabled(false);
				
				anim.path = puzzleSpace.solve();
				animateSolution();
			}
		});
		
		// Set up the skip check box.
		GridBagConstraints skipc = new GridBagConstraints();
		skipc.fill = GridBagConstraints.HORIZONTAL;
		skipc.weightx = 0.5;
		skipc.gridx = 3;
		skipc.gridy = 0;
		
		skip = new JCheckBox("Skip Animation");
		buttonSpace.add(skip, skipc);
		skip.addActionListener(new ActionListener() {
			/**
			 * Switches the skip variable in anim.
			 */
			@Override
			public void actionPerformed(ActionEvent event)
			{
				anim.skip = !anim.skip;
			}
		});
		
		// Set up the puzzle radio buttons.
		GridBagConstraints puzzleLabelc = new GridBagConstraints();
		puzzleLabelc.fill = GridBagConstraints.HORIZONTAL;
		puzzleLabelc.weightx = 0.5;
		puzzleLabelc.gridx = 0;
		puzzleLabelc.gridy = 1;
		
		JLabel puzzleLabel = new JLabel("Puzzle Type:");
		buttonSpace.add(puzzleLabel,puzzleLabelc);
		
		GridBagConstraints p8c = new GridBagConstraints();
		p8c.fill = GridBagConstraints.HORIZONTAL;
		p8c.weightx = 0.5;
		p8c.gridx = 1;
		p8c.gridy = 1;
		
		puzzle8 = new JRadioButton("8-puzzle", true);
		buttonSpace.add(puzzle8,p8c);
		puzzle8.addActionListener(new ActionListener() {
			/**
			 * Set Options.GRID_ROOT to 3 and split the image.
			 */
			@Override
			public void actionPerformed(ActionEvent event)
			{
				if(inAnimation)
					return;
				
				Options.GRID_ROOT = 3;
				puzzleSpace.splitImage();
				puzzleSpace.repaint();
			}
			
		});
		
		GridBagConstraints p15c = new GridBagConstraints();
		p15c.fill = GridBagConstraints.HORIZONTAL;
		p15c.weightx = 0.5;
		p15c.gridx = 2;
		p15c.gridy = 1;
		
		puzzle15 = new JRadioButton("15-puzzle", false);
		buttonSpace.add(puzzle15,p15c);
		puzzle15.addActionListener(new ActionListener() {
			/**
			 * Set Options.GRID_ROOT to 4 and split the image.
			 */
			@Override
			public void actionPerformed(ActionEvent event)
			{
				if(inAnimation)
					return;
				
				Options.GRID_ROOT = 4;
				puzzleSpace.splitImage();
				puzzleSpace.repaint();
			}
		});
		
		GridBagConstraints p24c = new GridBagConstraints();
		p24c.fill = GridBagConstraints.HORIZONTAL;
		p24c.weightx = 0.5;
		p24c.gridx = 3;
		p24c.gridy = 1;
		
		puzzle24 = new JRadioButton("24-puzzle", false);
		buttonSpace.add(puzzle24,p24c);
		puzzle24.addActionListener(new ActionListener() {
			/**
			 * Set Options.GRID_ROOT to 5 and split the image.
			 */
			@Override
			public void actionPerformed(ActionEvent event)
			{
				if(inAnimation)
					return;
				
				Options.GRID_ROOT = 5;
				puzzleSpace.splitImage();
				puzzleSpace.repaint();
			}
		});
		
		puzzGroup = new ButtonGroup();
		puzzGroup.add(puzzle8);
		puzzGroup.add(puzzle15);
		puzzGroup.add(puzzle24);
		
		// Set up the slider to control animation speed.
		GridBagConstraints animLabelc = new GridBagConstraints();
		animLabelc.fill = GridBagConstraints.HORIZONTAL;
		animLabelc.weightx = 0.5;
		animLabelc.gridx = 0;
		animLabelc.gridy = 2;
		
		JLabel animLabel = new JLabel("Animation Speed:");
		buttonSpace.add(animLabel,animLabelc);
		
		GridBagConstraints animSpeedc = new GridBagConstraints();
		animSpeedc.fill = GridBagConstraints.HORIZONTAL;
		animSpeedc.weightx = 0.5;
		animSpeedc.gridx = 1;
		animSpeedc.gridy = 2;
		animSpeedc.gridwidth = 3;
		
		animSpeed = new JSlider();
		animSpeed.setMaximum(200);
		animSpeed.setMajorTickSpacing(25);
		animSpeed.setPaintTicks(true);
		Hashtable<Integer, JLabel> labelTable = new Hashtable<Integer, JLabel>();
		labelTable.put(0, new JLabel("Pause"));
		labelTable.put(25, new JLabel("Slow"));
		labelTable.put(100, new JLabel("Fast"));
		labelTable.put(200, new JLabel("Very Fast"));
		animSpeed.setLabelTable(labelTable);
		animSpeed.setPaintLabels(true);
		
		animSpeed.addChangeListener(new ChangeListener() {
			/**
			 * Changes the animation speed based on slider value.
			 */
			@Override
			public void stateChanged(ChangeEvent event)
			{
				JSlider source = (JSlider)event.getSource();
				int percent = source.getValue();
				Options.ARATE = Constants.ANIMATION_BASE*percent;
			}
		});
		
		buttonSpace.add(animSpeed,animSpeedc);
		
		cp.add(buttonSpace, BorderLayout.SOUTH);
		
		// Set up the window.
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setResizable(false);
		
		frame.pack();
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		Rectangle bounds = frame.getBounds();
		frame.setLocation(screenSize.width/2 - bounds.width/2,screenSize.height/2 - bounds.height/2);
		frame.setVisible(true);
	}
	
	/**
	 * Sets up a Timer and ActionListener to animate the solution on puzzleSpace.
	 */
	private void animateSolution()
	{
		Location emptyLoc = puzzleSpace.getEmptyLoc();
		if(anim.path == null || emptyLoc == null)
		{
			puzzle8.setEnabled(true);
			puzzle15.setEnabled(true);
			puzzle24.setEnabled(true);
			inAnimation = false;
			return;
		}

		anim.timer = new Timer(16, null);
		ActionListener al = new ActionListener() 
		{
			/**
			 * Updates animation state and draws to puzzleSpace every time
			 * anim.timer fires an event.
			 */
			@Override
			public void actionPerformed(ActionEvent ae) 
			{
				if(anim.skip)
				{
					// Skip the animation and reset the puzzle.
					anim.finish = true;
					anim.timer.stop();
					puzzleSpace.resetEmpty();
					puzzle8.setEnabled(true);
					puzzle15.setEnabled(true);
					puzzle24.setEnabled(true);
					puzzleSpace.splitImage();
					inAnimation = false;
					puzzleSpace.repaint();
					return;
				}
				
				if(anim.finish)
				{
					// If animation is finished start another one.
					anim.dir = anim.path.poll();
					if(anim.dir == null)
					{
						// When no animations are left return.
						anim.timer.stop();
						puzzleSpace.resetEmpty();
						puzzle8.setEnabled(true);
						puzzle15.setEnabled(true);
						puzzle24.setEnabled(true);
						inAnimation = false;
						puzzleSpace.repaint();
						return;
					}
					else
					{
						// Perform a computer move and figure out the goal location.
						anim.loc = puzzleSpace.computerMove(anim.dir);
						if(anim.loc == null)
						{
							System.err.println("Something went wrong with the animation.");
							System.exit(0);
						}
						anim.tilePos = puzzleSpace.getPosition(anim.loc.row, anim.loc.col);
						if(anim.tilePos == null)
						{
							System.err.println("Something went wrong with the animation.");
							System.exit(0);
						}
						anim.tile = puzzleSpace.getTile(anim.loc.row,anim.loc.col);
						if(anim.tile == null)
						{
							System.err.println("Something went wrong with the animation.");
							System.exit(0);
						}
						
						anim.gx = anim.tilePos.x;
						anim.gy = anim.tilePos.y;

						// Change the tilePos to the old position to begin the animation.
						switch(anim.dir.byteValue())
						{
						case Constants.LEFT:
							anim.tilePos.x = anim.gx - anim.tile.width;
							anim.animation = -.99;
							break;
						case Constants.RIGHT:
							anim.tilePos.x = anim.gx + anim.tile.width;
							anim.animation = .99;
							break;
						case Constants.UP:
							anim.tilePos.y = anim.gy - anim.tile.height;
							anim.animation = -.99;
							break;
						case Constants.DOWN:
							anim.tilePos.y = anim.gy + anim.tile.height;
							anim.animation = .99;
							break;
						default:
							break;
						}

						anim.finish = false;
					}
				}
				else
				{
					anim.rate = Options.ARATE;
					// Perform the animation based on the direction of motion.
					// Updates once everytime timer is fired. When finished
					// anim.finished becomes true.
					switch(anim.dir.byteValue())
					{
					case Constants.LEFT:
						if(anim.tilePos.x < anim.gx)
						{
							anim.tilePos.x = anim.gx + (int)(anim.animation*anim.tile.width);
							anim.animation += anim.rate;
						}
						else
						{
							anim.tilePos.x = anim.gx;
							anim.finish = true;
						}
						break;
					case Constants.RIGHT:
						if(anim.tilePos.x > anim.gx)
						{
							anim.tilePos.x = anim.gx + (int)(anim.animation*anim.tile.width);
							anim.animation -= anim.rate;
						}
						else
						{
							anim.tilePos.x = anim.gx;
							anim.finish = true;
						}
						break;
					case Constants.UP:
						if(anim.tilePos.y < anim.gy)
						{
							anim.tilePos.y = anim.gy + (int)(anim.animation*anim.tile.height);
							anim.animation += anim.rate;
						}
						else
						{
							anim.tilePos.y = anim.gy;
							anim.finish = true;
						}
						break;
					case Constants.DOWN:
						if(anim.tilePos.y > anim.gy)
						{
							anim.tilePos.y = anim.gy + (int)(anim.animation*anim.tile.height);
							anim.animation -= anim.rate;
						}
						else
						{
							anim.tilePos.y = anim.gy;
							anim.finish = true;
						}
						break;
					default:
						break;
					}

					puzzleSpace.repaint();
				}
			}
		};

		anim.timer.addActionListener(al);
		anim.timer.start();
	}

	/**
	 * The main function. Sets style to system default and runs program on Event Dispatch Thread.
	 * @param args - unused.
	 */
	public static void main(String[] args)
	{
		try 
		{
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch(UnsupportedLookAndFeelException e)
		{
			System.err.println("Unsupported look and feel!");
			System.exit(0);
		} catch(ClassNotFoundException e)
		{
			System.err.println("Class Not Found for look and feel!");
			System.exit(0);
		} catch(InstantiationException e)
		{
			System.err.println("Instantiation failed for look and feel!");
			System.exit(0);
		} catch(IllegalAccessException e)
		{
			System.err.println("Illegal Access for look and feel!");
			System.exit(0);
		}
		
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				new SlidingPuzzle();
			}
		});
	}
}
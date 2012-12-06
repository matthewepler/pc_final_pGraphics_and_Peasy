import controlP5.*;
ControlP5 controlP5;
ControlWindow controlWindow;

import peasy.*;
PeasyCam cam;

PGraphics canvas;
int canvas_width = 3300;  // for printing 11" x 17"
int canvas_height = 5100; // landscape orientation
float cutter = 0.15;

ArrayList<Cube> cubes = new ArrayList();
float boxSize, halfBox, barWidth;
int tDimension, spacer, sides;


void setup()
{
 size( int( canvas_width*cutter ), int( canvas_height*cutter ), OPENGL );
 canvas = createGraphics( canvas_width, canvas_height, OPENGL );
 
 cam = new PeasyCam(this, 100, 1, -1, 1);
 
 initControls();
 
 boxSize = canvas.width / 40;
 halfBox = boxSize / 2;
 barWidth = 0.5;
 tDimension = 5;
 spacer = 4;
 sides = 3;

 generateCubes();

 ortho( -width/2, width/2, height/2, -height/2, -1000, 1000 );

 int half = (int) cubes.size()/2;
 Cube center = cubes.get( half );

 cam.lookAt( center.posX, center.posY, center.posZ );
}


void draw()
{
 canvas.background( 15 );
 canvas.fill( 255 );
 canvas.noStroke();
 canvas.smooth();

  for( int i = 0; i < cubes.size(); i++ )
  {
    Cube thisCube = cubes.get( i );
    thisCube.render();
  }
}


void generateCubes()
{
	for( int y = 0; y < tDimension; y++ ) 		 // generate cubes one vertical level at a time
 	{
	 	for( int x = 0; x < tDimension; x++ )
	 	{
	 		for( int z = 0; z < tDimension; z++ )
	 		{
	 			Cube newCube = new Cube( sides, x * boxSize * spacer, 
	 											y * boxSize * spacer * -1, 
	 											z * boxSize * spacer );
	 			cubes.add( newCube );
	 		}
	 	}
 	}
}


void initControls()
{
  controlP5 = new ControlP5(this);
  ControlWindow cw = controlP5.addControlWindow("MAIN CONTROLS",330,430);
  cw.setLocation(10,10);
  ControlGroup variables = controlP5.addGroup("Variables",30,30);
  variables.moveTo(cw);

  controlP5.begin(variables,0,10);

  controlP5.addSlider("boxSize", 0, canvas.width/4 ).linebreak();
  controlP5.addSlider("barWidth", 0, 6 ).linebreak();

  controlP5.end();  
}

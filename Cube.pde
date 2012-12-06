class Cube 
{
  
 PVector center, A, B, C, D, E, F, G, H;
 ArrayList edgeValues = new ArrayList();
 int[] edges;
 int edgeCount;
 float posX, posY, posZ;
 ArrayList neighbors = new ArrayList();
 
 // ---------------------------------------------- CONSTRUCTORS //
 Cube() 
 {
 }
 
 Cube ( int _edgeCount, float _x, float _y, float _z ) 
 {
  edgeCount = _edgeCount;
  edges = new int[ edgeCount ];
  posX = _x;
  posY = _y;
  posZ = _z;
  setVectors();
  setEdges();
 }


// ----------------------------------------------- FUNCTIONS //

void setVectors() 
 {
  center = new PVector( 0, 0, 0 );
// --------------------------------------------- Top //
  A = new PVector( center.x - halfBox, center.y - halfBox, center.z + halfBox );
  B = new PVector( center.x + halfBox, center.y - halfBox, center.z + halfBox );
  C = new PVector( center.x + halfBox, center.y - halfBox, center.z - halfBox );
  D = new PVector( center.x - halfBox, center.y - halfBox, center.z - halfBox );
// ------------------------------------------ Bottom // 
  E = new PVector( center.x - halfBox, center.y + halfBox, center.z + halfBox );
  F = new PVector( center.x + halfBox, center.y + halfBox, center.z + halfBox );
  G = new PVector( center.x + halfBox, center.y + halfBox, center.z - halfBox );
  H = new PVector( center.x - halfBox, center.y + halfBox, center.z - halfBox );
 }


void render()
{
  canvas.pushMatrix();
    canvas.translate( posX, posY, posZ );
    for( int i = 0; i < edges.length; i++ )
    {
      drawSingleEdge( edges[i] );
    }
  canvas.popMatrix();
}
 
 
  void setEdges()
 {
  edgeValues.clear();

  // fill up the array with values 1 - 12
  for( int i = 0; i < 12; i++ )
  {
    Value thisValue = new Value( i );
    edgeValues.add( thisValue );
  }
  /* from 0 to edgeCount, pick a random value between 0 
  and the size of the ArrayList and add it to edges array. 
  These are the ones that will get drawn.
  Then remove the Value from the ArrayList of possible
  edges so we don't draw it twice.
  */
  for( int i = 0; i < edgeCount; i++ )
  {
    int ran = floor( random( 0, edgeValues.size() ) );
    Value thisValue = ( Value ) edgeValues.get( ran );
    edges[ i ] = thisValue.num;
    edgeValues.remove( thisValue );
  }
  
 }



void drawSingleEdge( int _i ) 
{
  switch( _i )
  {
   /*----------------------------------------------- TOP EDGES */
   case 0:
   canvas.pushMatrix();
    canvas.translate( A.x, A.y, A.z );
    canvas.translate( halfBox, 0, 0 );
    canvas.box( boxSize + barWidth, barWidth, barWidth );
   canvas.popMatrix();
   break;
  
   case 1:
   canvas.pushMatrix();
    canvas.translate( B.x, B.y, B.z );
    canvas.translate( 0, 0, -halfBox );
    canvas.box( barWidth, barWidth, boxSize + barWidth );
   canvas.popMatrix();
   break;
  
   case 2:
   canvas.pushMatrix();
    canvas.translate( C.x, C.y, C.z );
    canvas.translate( -halfBox, 0, 0 );
    canvas.box( boxSize + barWidth, barWidth, barWidth );
   canvas.popMatrix();
   break;
  
   case 3:
   canvas.pushMatrix();
    canvas.translate( D.x, D.y, D.z );
    canvas.translate( 0, 0, halfBox );
    canvas.box( barWidth, barWidth, boxSize + barWidth );
   canvas.popMatrix();
   break;
   
   /*-------------------------------------------- BOTTOM EDGES */
   case 4:
   canvas.pushMatrix();
    canvas.translate( E.x, E.y, E.z );
    canvas.translate( halfBox, 0, 0 );
    canvas.box( boxSize + barWidth, barWidth, barWidth );
   canvas.popMatrix();
   break;
  
   case 5:
   canvas.pushMatrix();
    canvas.translate( F.x, F.y, F.z );
    canvas.translate( 0, 0, -halfBox );
    canvas.box( barWidth, barWidth, boxSize + barWidth );
   canvas.popMatrix();
   break;
  
   case 6:
   canvas.pushMatrix();
    canvas.translate( G.x, G.y, G.z );
    canvas.translate( -halfBox, 0, 0 );
    canvas.box( boxSize + barWidth, barWidth, barWidth );
   canvas.popMatrix();
   break;
  
   case 7:
   canvas.pushMatrix();
    canvas.translate( H.x, H.y, H.z );
    canvas.translate( 0, 0, halfBox );
    canvas.box( barWidth, barWidth, boxSize + barWidth );
   canvas.popMatrix();
   break;
  
   /*-------------------------------------------- VERTICAL EDGES */
   case 8:
   canvas.pushMatrix();
    canvas.translate( E.x, E.y, E.z );
    canvas.translate( 0, -halfBox, 0 );
    canvas.box( barWidth, boxSize + barWidth, barWidth );
   canvas.popMatrix();
   break;
  
   case 9:
   canvas.pushMatrix();
    canvas.translate( F.x, F.y, F.z );
    canvas.translate( 0, -halfBox, 0 );
    canvas.box( barWidth, boxSize + barWidth, barWidth );
   canvas.popMatrix();
   break;
  
   case 10:
   canvas.pushMatrix();
    canvas.translate( G.x, G.y, G.z );
    canvas.translate( 0, -halfBox, 0 );
    canvas.box( barWidth, boxSize + barWidth, barWidth );
   canvas.popMatrix();
   break;
  
   case 11:
   canvas.pushMatrix();
    canvas.translate( H.x, H.y, H.z );
    canvas.translate( 0, -halfBox, 0 );
    canvas.box( barWidth, boxSize + barWidth, barWidth );
   canvas.popMatrix();
   break;
   } // end of sweitch
}



 void drawRefs()  
 {
  // ------------------------------------ XYZ Guides //
  stroke( 255, 0, 0 );
  line( 0, 0, 0, 25, 0, 0 );
  stroke( 0, 255, 0 );
  line( 0, 0, 0, 0, 25, 0 );
  stroke( 0, 0, 255 );
  line( 0, 0, 0, 0, 0, 25 );
  // --------------------------------------- Ref Box //
  // stroke( 255 );
  // box( boxSize );
 }
  
}

int canvasSize = 512;
int fieldSize = 8;
int cellSize;

int field[][];
int row;
int col;
int hasStone = 1;

String strPlus(int intValue)
{
  String strValue = new String("[" + intValue + "]" + ", ");

  return strValue;
}

int mousePos(float mousePos)
{
  int tempInt = floor(mousePos / (canvasSize / fieldSize));
  return tempInt;
}

void setup()
{
  size(512, 512);
  background(0, 140, 0);
  FieldSetUp();
  GridDraw();
  DebugDraw();
}

void draw() {
}

void mousePressed()
{
  int row = mousePos(mouseX);
  int col = mousePos(mouseY);

  if (field[row][col] ==  0 && CellCanPutCheck(row, col))
  {
    field[row][col] = hasStone;
    CellDraw(row, col);
  }

  DebugDraw();
}

void FieldSetUp()
{
  int iniPos = fieldSize / 2 - 1;
  field = new int[fieldSize][fieldSize];

  for (row = 0; row < fieldSize; row++)
  {
    for (col = 0; col < fieldSize; col++)
    {
      field[row][col] = 0;//0 = null, 1 == white. -1 == black
    }
  }

  //初期値
  field[iniPos][iniPos] = hasStone;//white
  println(hasStone);
  CellDraw(iniPos, iniPos);

  field[iniPos + 1][iniPos] = hasStone;//black
  println(hasStone);
  CellDraw(iniPos + 1, iniPos);

  field[iniPos + 1][iniPos + 1] = hasStone;//white
  println(hasStone);
  CellDraw(iniPos + 1, iniPos + 1);

  field[iniPos][iniPos + 1] = hasStone;//black
  println(hasStone);
  CellDraw(iniPos, iniPos + 1);
}

void DebugDraw()
{
  println("");
  println("↓col/row→");

  for (int a = 0; a < fieldSize; a++)
  {
    if (a == 0) print("  ");
    print(a);
    if (a != fieldSize - 1)  print("    ");
  }

  println();

  for (int i = 0; i < fieldSize; i++)
  {
    if (i != 0)  println("");
    print(i);

    for (int j = 0; j < fieldSize; j++)
    {
      print(strPlus(field[j][i]));
    }

    println("");
  }
}

void GridDraw()
{
  float posX, posY;

  for (int i = 0; i < fieldSize; i++)
  {
    posX = (canvasSize / fieldSize);
    posY = (canvasSize / fieldSize);

    fill(255);
    strokeWeight(1);
    line(i * posX, width, i * posX, -width);//col
    line(height, i * posY, -height, i * posY);//row
  }
}

void CellDraw(int rowNum, int colNum)
{
  if (field[rowNum][colNum] == 1)
  {
    fill(255);
  } else if (field[rowNum][colNum] == -1)
  {
    fill(0);
  }

  hasStone *= -1;

  int cellX = rowNum * (canvasSize / fieldSize) + ((canvasSize / fieldSize) / 2);
  int cellY = colNum * (canvasSize / fieldSize) + ((canvasSize / fieldSize) / 2);
  int cellSize = (canvasSize / fieldSize) - 10;

  ellipseMode(CENTER);
  ellipse(cellX, cellY, cellSize, cellSize);
}

boolean CellCanPutCheck(int startRow, int startCol)//周りに何があるか検知
{
  boolean canPutCell = false;//最終的な判断

  for (int dirRow = -1; dirRow < 2; dirRow++)
  {
    for (int dirCol = -1; dirCol < 2; dirCol++)
    {
      if (startRow + dirRow != 0 && startCol + dirCol != 0)//0, 0(中心)以外
      {
        
      }

      println("dirRow = " + dirRow + ", " + "dirCol = " + dirCol);
    }
  }

  return canPutCell;
}

/*
      0, -1上
 0, 1下
 
 -1, -1右上
 1, 1右下
 
 -1, 0左
 1, 0右
 
 -1, -1左上;
 -1, 1左下
 
 (-1, -1)  (0, -1)  (1, -1)
 左上         上       右上
 (-1, 0)  左  @  右  (1, 0)
 左下         下       右下
 (-1, 1)   (0, 1)   (1, 1)
 */

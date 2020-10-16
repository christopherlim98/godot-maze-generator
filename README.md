# godot-maze-generator
 Procedurally generates maze using the recursive backtracker algorithm </br>

![maze generator](https://media.giphy.com/media/my632TvvKCHuqJFoSq/giphy.gif)

Over summer, I was inspired to make a game. Tower defense has been a big part of my childhood, so naturally I wanted to see how I can begin:

> Explore the possibility of a tower defense game where paths are procedurally generated.

To begin, procedural generation has always fascinated me. I have watched a few videos about procedural generation in 3D games (e.g. No Man's Sky) and also looked at some theory behind it (e.g. perlin noise and pseudo-random numbers).

In the gif above, we use a recursive backtracking algorithm to build a maze.

Data structure used: stacks and arrays.

Pseudocode:
 1. Generate array of all unvisited cells
 2. At current cell, add current cell to visited stack.
 3. Check neighbours.  
  3a. If neighbours exist, pick one at random and move in that direction. </br> 
  3b. If neighbours don't exist, retrieve new current from visited stack. Pop current from visited stack.
 4. Repeat steps 2 and 3 until there are no visited cells.

## Concluding thoughts
> Is this procedural generation or random generation?

Procedural generation implies that there is some sort of order, like using perlin noise to create terrains and sine functions to generate waves. Random generation implies no order, there would be no meaning behind the generated world. In the maze context, this would result in roads that lead to nowhere. Insofar as the tiles have the context of direction, and that there is some order to its generation, this is more akin to procedural generation.



# credits </br>
 https://kenney.nl/assets/road-textures </br>
 https://kenney.nl/assets/tower-defense-kit </br>
 https://www.youtube.com/playlist?list=PLsk-HSGFjnaH82Bn6xbQNehatj3sIvtMQ </br>


extends Node2D

onready var Map = $TileMap

const N = 1
const E = 2
const S = 4
const W = 8

# dict mapping direction to vectors.
var cell_walls = {Vector2(0, -1): N, Vector2 (1, 0): E, Vector2(0,1) : S, Vector2(-1, 0) : W}

var map_seed = 0
var width = 40
var height = 20

func _ready() -> void:
	$Camera2D.make_current()
	$Camera2D.zoom = Vector2(2,2)
	$Camera2D.position = Map.map_to_world(Vector2(width/2, height/2))
	randomize()
	if !map_seed:
		map_seed = randi()
	seed(map_seed)
	print("Seed: ", map_seed)
	make_maze()

func check_neighbours(cell, unvisited) :
	# checks if neighbour is visited.
	# returns array of unvisited neighbours.
	var list = []
	for dir in cell_walls.keys():
		if cell + dir in unvisited:
			list.append(cell + dir)
	return list

func make_maze() -> void:
	var unvisited = []
	var stack = []

	Map.clear()
	for x in range(width):
		for y in range(height):
			unvisited.append(Vector2(x,y))
			Map.set_cellv(Vector2(x,y), N|E|S|W) # N|E|S|W gives 15, labeled as the solid green tile
	var current = Vector2(0,0)
	unvisited.erase(current)

	#recurive backtracking algorithm
	while unvisited.size() > 0:
		# check neighbours of current cell.
		var neighbours = check_neighbours(current, unvisited)

		# if neighbours exist, pick one at random and move in that direction.
		# remove wall between current cell and neighbour cell.
		if neighbours.size() > 0:
			var next: Vector2 = neighbours[randi() % neighbours.size()]
			stack.append(current)
			# remove wall from both cells.
			var dir :Vector2 = next - current
			var current_walls: int = Map.get_cellv(current) - cell_walls[dir]
			var next_walls: int = Map.get_cellv(next) - cell_walls[-dir]
			Map.set_cellv(current, current_walls)
			Map.set_cellv(next, next_walls)
			current = next
			unvisited.erase(current)

		# if neighbours don't exist, retrieve new current from stack.
		elif stack:
			current = stack.pop_back()

		yield(get_tree(), "idle_frame")

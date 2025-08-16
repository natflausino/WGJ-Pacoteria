extends Node2D

#Validacão da Celula (VCell)
var VCell = []


#Rotação esperada (ERotation)
var ERotation = [0, 0, 0, 90, 90, 0, 0, 0, 90, 90, 0, 90, 0, 0]

#Rotação da Celula (RCell)
@export var RCell: Array [Sprite2D]

#instanciando a classe que determina vitoria
const Classevitoria = preload("res://puzzle/DVitory_class.gd")
var Dvitory

func _ready():
	#conectando valores da classe atual com a classe que determina vitoria
	Dvitory = Classevitoria.new()
	add_child(Dvitory)
	Dvitory.vitoria.connect(recarregar_cena)
	
	# Busca por nós do tipo 'Button' em toda a hierarquia de descendentes.
	var buttons = find_children("", "Button", true)
	for button in buttons:
		button.pressed.connect(_on_any_button_pressed)
	
	#muda o tamanho do array de VCell para o mesmo tamanho do array de RCell
	VCell.resize(RCell.size())

#Inspecionar a rotação da celula e definir seu valor booleano
func _on_any_button_pressed():
		Dvitory.VCell = VCell
		for i in range(RCell.size()):
			if i <= ERotation.size():
				if is_equal_approx(RCell[i].rotation_degrees, ERotation[i]):
					VCell[i]=true
					print("Cell",i+1,"é true")
				else:
					VCell[i]=false
					print("Cell",i+1,"é false")
		Dvitory.determina_Vitoria()
	
func recarregar_cena():
	var Victory_sound = $Victorysound as AudioStreamPlayer
	Victory_sound.play()
	await get_tree().create_timer(1.0).timeout
	
	await get_tree().process_frame
	var result = get_tree().change_scene_to_file("res://dias/scenes/day2/dia23.tscn")
	if result != OK:
		print("Falha")

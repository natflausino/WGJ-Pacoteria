extends Node2D

#Validacão da Celula (VCell)
var VCell = []

#Rotação esperada (ERotation)
var ERotation = [90, 0, 90, 90, 90, 0, 90, 90]

#Rotação da Celula (RCell)
@export var RCell: Array [Sprite2D]

# Busca por nós do tipo 'Button' em toda a hierarquia de descendentes.
func _ready():
	var buttons = find_children("", "Button", true)
	
	#muda o tamanho do array de VCell para o mesmo tamanho do array de RCell
	VCell.resize(RCell.size())
	
	for button in buttons:
		button.pressed.connect(_on_any_button_pressed)

#Inspecionar a rotação da celula e definir seu valor booleano
func _on_any_button_pressed():
		for i in range(RCell.size()):
			if i <= ERotation.size():
				if RCell[i].rotation_degrees == ERotation[i]:
					VCell[i]=true
					print("Cell",i+1,"é true")
				else:
					VCell[i]=false
					print("Cell",i+1,"é false")
			determina_Vitoria()
	
func recarregar_cena():
	await get_tree().process_frame
	var result = get_tree().change_scene_to_file("res://dias/scenes/day2/dia22.tscn")
	if result != OK:
		print("Falha")
		
	#get_tree().reload_current_scene()
# Não precisamos continuar, já sabemos que uma é false

func determina_Vitoria():
	var verifica_Valor = VCell.all(func(valor):return valor)
	if verifica_Valor:
		print("Todas as 7 variáveis no array são true! O jogo reiniciou.")
		recarregar_cena()
	

extends Node2D

#Validacão da Celula (VCell)
var VCell = []


#Rotação da Celula (RCell)
@export var RCell: Array [Sprite2D]

# Busca por nós do tipo 'Button' em toda a hierarquia de descendentes.
func _ready():
	var buttons = find_children("", "Button", true)
	
	VCell.resize(14)
	
	for button in buttons:
		button.pressed.connect(_on_any_button_pressed)

#Inspecionar a rotação da celula e definir seu valor booleano
func _on_any_button_pressed():
		
	if RCell[0].rotation_degrees == 0:
		VCell[0] = true
		print("cell1 é true")
		determina_Vitoria()
	else:
		VCell[0] = false
		print("cell1 é false")
		
	if RCell[1].rotation_degrees == 0:
		VCell[1] = true
		print("cell2 é true")
		determina_Vitoria()
	else:
		VCell[1] = false
		print("cell2 é false")
	
	if RCell[2].rotation_degrees == 0:
		VCell[2] = true
		print("cell3 é true")
		determina_Vitoria()
	else:
		VCell[2] = false
		print("cell3 é false")
		
	if RCell[3].rotation_degrees == 90:
		VCell[3] = true
		print("cell4 é true")
		determina_Vitoria()
	else:
		VCell[3] = false
		print("cell4 é false")
		
	if RCell[4].rotation_degrees == 0:
		VCell[4] = true
		print("cell5 é true")
		determina_Vitoria()
	else:
		VCell[4] = false
		print("cell5 é false")
		
	if RCell[5].rotation_degrees == 0:
		VCell[5] = true
		print("cell6 é true")
		determina_Vitoria()
	else:
		VCell[5] = false
		print("cell6 é false")
		
	if RCell[6].rotation_degrees == 90:
		VCell[6] = true
		print("cell7 é true")
		determina_Vitoria()
	else:
		VCell[6] = false
		print("cell7 é false")
	
	if RCell[7].rotation_degrees == 0:
		VCell[7] = true
		print("cell8 é true")
		determina_Vitoria()
	else:
		VCell[7] = false
		print("cell8 é false")
	
	if RCell[8].rotation_degrees == 90:
		VCell[8] = true
		print("cell9 é true")
		determina_Vitoria()
	else:
		VCell[8] = false
		print("cell9 é false")
		
	if RCell[9].rotation_degrees == 0:
		VCell[9] = true
		print("cell10 é true")
		determina_Vitoria()
	else:
		VCell[9] = false
		print("cell10 é false")
		
	if RCell[10].rotation_degrees == 0:
		VCell[10] = true
		print("cell11 é true")
		determina_Vitoria()
	else:
		VCell[10] = false
		print("cell11 é false")
		
	if RCell[12].rotation_degrees == 90:
		VCell[12] = true
		print("cell13 é true")
		determina_Vitoria()
	else:
		VCell[12] = false
		print("cell13 é false")
	
	if RCell[13].rotation_degrees == 0:
		VCell[13] = true
		print("cell14 é true")
		determina_Vitoria()
	else:
		VCell[13] = false
		print("cell14 é false")
		
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
	

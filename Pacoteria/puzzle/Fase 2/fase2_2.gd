extends Node2D

#Validacão da Celula (VCell)
var VCell = [false, false, false, false, false]

#Rotação da Celula (RCell)
@export var RCell1: Sprite2D
@export var RCell3: Sprite2D
@export var RCell4: Sprite2D
@export var RCell6: Sprite2D
@export var RCell7: Sprite2D

# Busca por nós do tipo 'Button' em toda a hierarquia de descendentes.
func _ready():
	var buttons = find_children("", "Button", true)
	
	for button in buttons:
		button.pressed.connect(_on_any_button_pressed)

#Inspecionar a rotação da celula e definir seu valor booleano
func _on_any_button_pressed():
		
	if RCell1.rotation_degrees == 90:
		VCell[0] = true
		print("cell1 é true")
		determina_Vitoria()
	else:
		VCell[0] = false
		print("cell1 é false")
		
	if RCell3.rotation_degrees == 90:
		VCell[1] = true
		print("cell3 é true")
		determina_Vitoria()
	else:
		VCell[1] = false
		print("cell3 é false")
	
	if RCell4.rotation_degrees == 90:
		VCell[2] = true
		print("cell4 é true")
		determina_Vitoria()
	else:
		VCell[2] = false
		print("cell4 é false")
		
	if RCell6.rotation_degrees == 90:
		VCell[3] = true
		print("cell6 é true")
		determina_Vitoria()
	else:
		VCell[3] = false
		print("cell6 é false")
		
	if RCell7.rotation_degrees == 0:
		VCell[4] = true
		print("cell7 é true")
		determina_Vitoria()
	else:
		VCell[4] = false
		print("cell7 é false")
		
func recarregar_cena():
	await get_tree().process_frame
	var result = get_tree().change_scene_to_file("res://dias/scenes/day2/dia2_3.tscn")
	if result != OK:
		print("Falha")
# Não precisamos continuar, já sabemos que uma é false

func determina_Vitoria():
	var verifica_Valor = VCell.all(func(valor):return valor)
	if verifica_Valor:
		print("Todas as 7 variáveis no array são true! O jogo reiniciou.")
		recarregar_cena()
	else:
		print("Pelo menos uma das variáveis no array é false. O evento não pode acontecer.")

extends Node2D

#Validacão da Celula (VCell)
var VCell = [false, false, false, true, true, true, false, false, true, false, false]

#Rotação da Celula (RCell)
@export var RCell1: Sprite2D
@export var RCell2: Sprite2D
@export var RCell3: Sprite2D
@export var RCell4: Sprite2D
@export var RCell5: Sprite2D
@export var RCell7: Sprite2D
@export var RCell8: Sprite2D
@export var RCell9: Sprite2D
@export var RCell10: Sprite2D
@export var RCell11: Sprite2D
@export var RCell12: Sprite2D

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
	
	if RCell2.rotation_degrees == 90:
		VCell[1] = true
		print("cell1 é true")
		determina_Vitoria()
	else:
		VCell[1] = false
		print("cell1 é false")
		
	if RCell3.rotation_degrees == 0:
		VCell[2] = true
		print("cell3 é true")
		determina_Vitoria()
	else:
		VCell[2] = false
		print("cell3 é false")
	
	if RCell4.rotation_degrees == 0:
		VCell[3] = true
		print("cell4 é true")
		determina_Vitoria()
	else:
		VCell[3] = false
		print("cell4 é false")
		
	if RCell5.rotation_degrees == 0:
		VCell[4] = true
		print("cell5 é true")
		determina_Vitoria()
	else:
		VCell[4] = false
		print("cell5 é false")
		
	if RCell7.rotation_degrees == 90:
		VCell[5] = true
		print("cell7 é true")
		determina_Vitoria()
	else:
		VCell[5] = false
		print("cell7 é false")
	
	if RCell8.rotation_degrees == 0:
		VCell[6] = true
		print("cell8 é true")
		determina_Vitoria()
	else:
		VCell[6] = false
		print("cell8 é false")
		
	if RCell9.rotation_degrees == 90:
		VCell[7] = true
		print("cell9 é true")
		determina_Vitoria()
	else:
		VCell[7] = false
		print("cell9 é false")
		
	if RCell10.rotation_degrees == 90:
		VCell[8] = true
		print("cell10 é true")
		determina_Vitoria()
	else:
		VCell[8] = false
		print("cell10 é false")
		
	if RCell11.rotation_degrees == 0:
		VCell[9] = true
		print("cell7 é true")
		determina_Vitoria()
	else:
		VCell[9] = false
		print("cell7 é false")
	
	if RCell12.rotation_degrees == 90:
		VCell[10] = true
		print("cell7 é true")
		determina_Vitoria()
	else:
		VCell[10] = false
		print("cell7 é false")
		
func recarregar_cena():
	self.visible = false
	get_tree().reload_current_scene()
# Não precisamos continuar, já sabemos que uma é false

func determina_Vitoria():
	var verifica_Valor = VCell.all(func(valor):return valor)
	if verifica_Valor:
		print("Todas as 7 variáveis no array são true! O jogo reiniciou.")
		recarregar_cena()
	else:
		print("Pelo menos uma das variáveis no array é false. O evento não pode acontecer.")

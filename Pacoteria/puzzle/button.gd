extends Button

@export var parent_Cell: Sprite2D

func _ready():
	# Conecta o sinal 'pressed' à função que vai executar a lógica.
	pressed.connect(mudar_rotacao)

func mudar_rotacao():
	# Verifica a rotação em graus usando a propriedade correta.
	if parent_Cell.rotation_degrees == 0:
		# Se for 0, muda a rotação para 90 graus usando a propriedade correta.
		parent_Cell.rotation_degrees = 90
	else:
		parent_Cell.rotation_degrees = 0
		print("A rotação não é 0.")


func _on_pressed() -> void:
	pass # Replace with function body.

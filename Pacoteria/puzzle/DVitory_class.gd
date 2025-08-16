extends Node

var VCell = []

signal vitoria

func determina_Vitoria():
	var verifica_Valor = VCell.all(func(valor):return valor)
	if verifica_Valor:
		vitoria.emit()

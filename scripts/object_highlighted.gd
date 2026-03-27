extends TextureRect

func _mouse_entered() -> void:
	(material as ShaderMaterial).set_shader_parameter("shine", true)

func _mouse_exited() -> void:
	(material as ShaderMaterial).set_shader_parameter("shine", false)

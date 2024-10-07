extends StaticBody2D


var Bullet = preload("res://Towers/Red_Bullet.tscn")
var bulletDamage = 5
var pathNone
var currTargets = []
var curr




func _on_tower_body_entered(body: Node2D) -> void:
	if "Soilder A" in body.name:
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()
		
		for i in currTargets:
			if "Soilder" in i.name:
				tempArray.append(i)
		var currTarget = null
		
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
		
		
		curr = currTarget
		var pathName = currTarget.get_parent().name
		
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamage
		
		var bulletContainer = get_node("BulletContainer")
		if bulletContainer != null:
			bulletContainer.add_child(tempBullet)
			tempBullet.global_position = $Aim.global_position
		

func _on_tower_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

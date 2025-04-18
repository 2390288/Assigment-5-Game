# DepthLabel.gd
extends Label

func update_depth(meters: int):
	text = "Current Depth: %dm" % meters

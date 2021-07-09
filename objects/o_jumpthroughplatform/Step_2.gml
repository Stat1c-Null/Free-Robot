/// @description 

switch(object_index){
	case o_hMovingPlat:
	
		#region platform movement
			_hspd = _platDir * _moveSpeed
			var wallCollision = place_meeting(x + _hspd, y, o_wall)
			if(wallCollision){
				_platDir *= -1
			}
		#endregion
		
		#region move player with platform
			with(o_player){
				if(not place_meeting(x + other._hspd, y, o_wall)){
					if(place_meeting(x, y+1, other)){
						x += other._hspd
					}
				}
			}
		#endregion
		x += _hspd
		break;
	case o_vMovingPlat:
	
		#region vertical movement
			_vspd = _platDir * _moveSpeed
			var heightOffset = 100
			var upAndDownWallCollisions = place_meeting(x, y+_vspd+(heightOffset*_platDir), o_wall)
			if(upAndDownWallCollisions){
				_platDir *= -1
			}
		#endregion
		
		#region move player with platform
			with(o_player){
				if(not place_meeting(x, y + other._vspd, o_wall)){
					if(place_meeting(x, y+abs(other._vspd), other)){// and not place_meeting(x, y, other)
						y += other._vspd	
					}
				}
			}
		#endregion
		y += _vspd
	
		break;
}
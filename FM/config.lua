
_amortizer_min_length					= 0.0
_amortizer_max_length					= 0.02-- if these values are too small, it becomes jittery
_amortizer_basic_length					= 0.02
_amortizer_reduce_length				= 0.02
_allowable_hard_contact_length			= 0.02
_amortizer_spring_force_factor			= 1
_amortizer_spring_force_factor_rate		= 1
_amortizer_static_force					= 15
_amortizer_direct_damper_force_factor	= 15
_amortizer_back_damper_force_factor		= 1000


_wheel_radius					= 0.40
_wheel_static_friction_factor	= 1.11-- must be a different value than roll and glide, otherwise collision doesnt work
_wheel_side_friction_factor		= 1.1
_wheel_roll_friction_factor		= 1.09
_wheel_glide_friction_factor	= 1.09
_wheel_damage_force_factor		= 9999.0
_wheel_damage_speedX			= 900
_wheel_damage_delta_speedX		= 900
_wheel_brake_moment_max			= 500
_noise_k						= 0


FM = 
{
    disable_built_in_oxygen_system = true,
	center_of_mass = {0,0,0},  -- center of mass position relative to object 3d model center for empty aircraft
	moment_of_inertia = {0.08, 0.08, 0.08, 0}, -- moment of inertia of empty (Ixx,Iyy,Izz,Ixz DCS axis)/(Ix,Iz,Iy,Ixy normal axis) [kg*m^2]
	
	suspension = { 
		{ -- Front L
			collision_shell_name = "Line_STABIL_L",
		
			amortizer_min_length					= _amortizer_min_length,
			amortizer_max_length					= _amortizer_max_length,
			amortizer_basic_length					= _amortizer_basic_length,
			amortizer_reduce_length					= _amortizer_reduce_length,
			allowable_hard_contact_length			= _allowable_hard_contact_length,
			amortizer_spring_force_factor			= _amortizer_spring_force_factor, 
			amortizer_spring_force_factor_rate		= _amortizer_spring_force_factor_rate,
			amortizer_static_force					= _amortizer_static_force,
			amortizer_direct_damper_force_factor	= _amortizer_direct_damper_force_factor,
			amortizer_back_damper_force_factor		= _amortizer_back_damper_force_factor,			

			wheel_radius					= _wheel_radius,
			wheel_static_friction_factor	= _wheel_static_friction_factor,
			wheel_side_friction_factor		= _wheel_side_friction_factor,
			wheel_roll_friction_factor		= _wheel_roll_friction_factor,
			wheel_glide_friction_factor		= _wheel_glide_friction_factor,
			wheel_damage_force_factor		= _wheel_damage_force_factor,
			wheel_damage_speedX				= _wheel_damage_speedX,
			wheel_damage_delta_speedX		= _wheel_damage_delta_speedX,
			wheel_brake_moment_max			= _wheel_brake_moment_max,
			noise_k							= _noise_k,

		},
		{ -- Front R
			collision_shell_name = "Line_STABIL_R",
		
			amortizer_min_length					= _amortizer_min_length,
			amortizer_max_length					= _amortizer_max_length,
			amortizer_basic_length					= _amortizer_basic_length,
			amortizer_reduce_length					= _amortizer_reduce_length,
			allowable_hard_contact_length			= _allowable_hard_contact_length,
			amortizer_spring_force_factor			= _amortizer_spring_force_factor, 
			amortizer_spring_force_factor_rate		= _amortizer_spring_force_factor_rate,
			amortizer_static_force					= _amortizer_static_force,
			amortizer_direct_damper_force_factor	= _amortizer_direct_damper_force_factor,
			amortizer_back_damper_force_factor		= _amortizer_back_damper_force_factor,

			wheel_radius					= _wheel_radius,
			wheel_static_friction_factor	= _wheel_static_friction_factor,
			wheel_side_friction_factor		= _wheel_side_friction_factor,
			wheel_roll_friction_factor		= _wheel_roll_friction_factor,
			wheel_glide_friction_factor		= _wheel_glide_friction_factor,
			wheel_damage_force_factor		= _wheel_damage_force_factor,
			wheel_damage_speedX				= _wheel_damage_speedX,
			wheel_damage_delta_speedX		= _wheel_damage_delta_speedX,
			wheel_brake_moment_max			= _wheel_brake_moment_max,
			noise_k							= _noise_k,

		},
		{  -- Aft L
			collision_shell_name = "Line_WING_L",
			
			amortizer_min_length					= _amortizer_min_length,
			amortizer_max_length					= _amortizer_max_length,
			amortizer_basic_length					= _amortizer_basic_length,
			amortizer_reduce_length					= _amortizer_reduce_length,
			allowable_hard_contact_length			= _allowable_hard_contact_length,
			amortizer_spring_force_factor			= _amortizer_spring_force_factor, 
			amortizer_spring_force_factor_rate		= _amortizer_spring_force_factor_rate,
			amortizer_static_force					= _amortizer_static_force,
			amortizer_direct_damper_force_factor	= _amortizer_direct_damper_force_factor,
			amortizer_back_damper_force_factor		= _amortizer_back_damper_force_factor,

			wheel_radius					= _wheel_radius,
			wheel_static_friction_factor	= _wheel_static_friction_factor,
			wheel_side_friction_factor		= _wheel_side_friction_factor,
			wheel_roll_friction_factor		= _wheel_roll_friction_factor,
			wheel_glide_friction_factor		= _wheel_glide_friction_factor,
			wheel_damage_force_factor		= _wheel_damage_force_factor,
			wheel_damage_speedX				= _wheel_damage_speedX,
			wheel_damage_delta_speedX		= _wheel_damage_delta_speedX,
			wheel_brake_moment_max			= _wheel_brake_moment_max,
			noise_k							= _noise_k,

		},	
		{  -- Aft R
			collision_shell_name = "Line_WING_R",
			
			amortizer_min_length					= _amortizer_min_length,
			amortizer_max_length					= _amortizer_max_length,
			amortizer_basic_length					= _amortizer_basic_length,
			amortizer_reduce_length					= _amortizer_reduce_length,
			allowable_hard_contact_length			= _allowable_hard_contact_length,
			amortizer_spring_force_factor			= _amortizer_spring_force_factor, 
			amortizer_spring_force_factor_rate		= _amortizer_spring_force_factor_rate,
			amortizer_static_force					= _amortizer_static_force,
			amortizer_direct_damper_force_factor	= _amortizer_direct_damper_force_factor,
			amortizer_back_damper_force_factor		= _amortizer_back_damper_force_factor,

			wheel_radius					= _wheel_radius,
			wheel_static_friction_factor	= _wheel_static_friction_factor,
			wheel_side_friction_factor		= _wheel_side_friction_factor,
			wheel_roll_friction_factor		= _wheel_roll_friction_factor,
			wheel_glide_friction_factor		= _wheel_glide_friction_factor,
			wheel_damage_force_factor		= _wheel_damage_force_factor,
			wheel_damage_speedX				= _wheel_damage_speedX,
			wheel_damage_delta_speedX		= _wheel_damage_delta_speedX,
			wheel_brake_moment_max			= _wheel_brake_moment_max,
			noise_k							= _noise_k,

		},
	}, 
}
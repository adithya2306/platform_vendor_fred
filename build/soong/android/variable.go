package android
type Product_variables struct {
	Target_process_sdk_version_override struct {
		Cppflags []string
	}
	Target_shim_libs struct {
		Cppflags []string
	}
        Target_uses_color_metadata struct {
                Cppflags []string
        }
	Uses_generic_camera_parameter_library struct {
		Srcs []string
	}
}

type ProductVariables struct {
	Target_process_sdk_version_override *string `json:",omitempty"`
	Target_shim_libs  *string `json:",omitempty"`
	Target_uses_color_metadata  *bool `json:",omitempty"`
	Uses_generic_camera_parameter_library  *bool `json:",omitempty"`
	Specific_camera_parameter_library  *string `json:",omitempty"`
}

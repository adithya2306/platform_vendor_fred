package android
type Product_variables struct {
	Should_skip_waiting_for_qsee struct {
		Cflags []string
	}
	Supports_legacy_hw_fde struct {
		Cflags []string
	}
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
	Uses_qti_camera_device struct {
		Cppflags []string
		Shared_libs []string
	}
}

type ProductVariables struct {
	Target_process_sdk_version_override *string `json:",omitempty"`
	Target_shim_libs  *string `json:",omitempty"`
	Target_uses_color_metadata  *bool `json:",omitempty"`
	Uses_generic_camera_parameter_library  *bool `json:",omitempty"`
	Should_skip_waiting_for_qsee  *bool `json:",omitempty"`
	Specific_camera_parameter_library  *string `json:",omitempty"`
	Supports_legacy_hw_fde  *bool `json:",omitempty"`
	Uses_qti_camera_device  *bool `json:",omitempty"`
}

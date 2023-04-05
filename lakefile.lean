import Lake
open Lake DSL

package examples {
  -- add configuration options here
}

lean_lib Examples

@[default_target]
lean_exe Main

require Qpf from git "https://github.com/alexkeizer/qpf4.git" @ "1055bd0"

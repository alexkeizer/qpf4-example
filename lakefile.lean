import Lake
open Lake DSL

package scratch {
  -- add configuration options here
}

lean_lib Scratch

@[default_target]
lean_exe Main

require Qpf from git "https://github.com/alexkeizer/qpf4.git" @ "512160641c9cfc186cc8fac9903b1c42cdc84755"

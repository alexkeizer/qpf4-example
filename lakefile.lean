import Lake
open Lake DSL

package scratch {
  -- add configuration options here
  dependencies := #[{
    name := `qpf
    src := Source.git "https://github.com/alexkeizer/qpf4.git" "d770033610cc5597d95feeb9705170cef3e98715"
  }]
}

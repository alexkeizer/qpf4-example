import Scratch

def main : IO Unit := do
  let nats := QpfStream.naturals
  let mut evenNats := nats.add nats

  -- let list := evenNats.toList 1000
  -- IO.println list


  for i in List.range 1000 do
    let ⟨(hd : Nat), tl⟩ := evenNats.dest
    IO.println hd
    evenNats := tl

  return


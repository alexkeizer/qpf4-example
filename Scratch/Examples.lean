import Qpf

open MvQPF


data QpfList α 
  | nil
  | cons : α → QpfList α → QpfList α


codata QpfStream α where
  | mk : α → QpfStream α → QpfStream α



/-- The stream `0,0,0,...` -/
def QpfStream.zeroes : QpfStream Nat :=
  Cofix.corec (fun _ => 
    Shape.mk (0 : Nat) ()
  ) ()

/-- The stream `0,1,2,3,4,...` -/
def QpfStream.naturals : QpfStream Nat :=
  Cofix.corec (fun (i : Nat) => 
    Shape.mk (i : Nat) (i + 1 : Nat)
  ) 0


/-- Add two streams together -/
def QpfStream.add (as bs : QpfStream Nat) : QpfStream Nat :=
    Cofix.corec (fun ⟨as, bs⟩ => 
      let ⟨(a : Nat), as⟩ := Cofix.dest as;
      let ⟨(b : Nat), bs⟩ := Cofix.dest bs;
      Shape.mk (a + b : Nat) (as, bs)
    ) (as, bs)



def QpfStream.toList : QpfStream α → Nat → List α 
  | _, 0   => []
  | as, n+1 =>  
    let ⟨hd, tl⟩ := as.dest
    hd :: (toList tl n)


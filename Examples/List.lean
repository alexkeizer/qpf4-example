import Qpf

open MvQPF


data QpfList α 
  | nil
  | cons : α → QpfList α → QpfList α


namespace QpfList

def sizeOf [sizeOfElem : SizeOf α] :  QpfList α → Nat :=
  MvQPF.Fix.rec fun
    | .nil => 0
    | .cons a as => 
        let as : Nat := as
        (sizeOfElem.sizeOf a) + as
  

instance [SizeOf α] : SizeOf (QpfList α) where
  sizeOf := QpfList.sizeOf
    

theorem sizeOf_cons {as as' : QpfList α} :
  as.dest = .cons a as' → sizeOf as' < sizeOf as  :=
by
  intro h
  induction as using Fix.ind
  case h x ih =>
    rw[Fix.dest_mk] at h
    cases h
    simp[sizeOf, Fix.rec_eq]
    save;
    unfold MvFunctor.LiftP at ih
    rcases ih with ⟨u, ih⟩
    simp[MvFunctor.LiftP, MvFunctor.map] at ih
    simp[MvFunctor.map, TypeVec.id, Vec.append1]

  


def append (as bs : QpfList α) : QpfList α :=
  match h : as.dest with
    | .nil => bs
    | .cons a as => cons a (append as bs)
  termination_by append as bs => SizeOf.sizeOf as

end QpfList




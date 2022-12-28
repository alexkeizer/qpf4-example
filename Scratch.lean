import Qpf


data QpfList α 
  | nil
  | cons : α → QpfList α → QpfList α
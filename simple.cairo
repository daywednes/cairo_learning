%builtins output

func main(output_ptr) -> (output_ptr):
  assert [output_ptr] = 13
  assert [output_ptr + 1] = 43

  return (output_ptr=output_ptr + 2)
end

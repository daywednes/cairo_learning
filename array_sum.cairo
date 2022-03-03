%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

func array_product(arr : felt*, size) -> (product):
    if size == 0:
        return (product=1)
    end

    if size == 1:
        return (product=1)
    end

    # size is not zero.
    let (product_of_rest) = array_product(arr=arr + 2, size=size - 2)
    return (product=[arr] + product_of_rest)
end

func main{output_ptr : felt*}():
    const ARRAY_SIZE = 3

    # Allocate an array.
    let (ptr) = alloc()

    # Populate some values in the array.
    assert [ptr] = 2
    assert [ptr + 1] = 2
    assert [ptr + 2] = 1206167596222043737899107594365023368541035738443865566657697352045290673496

    # Call array_sum to compute the sum of the elements.
    let (product) = array_product(arr=ptr, size=ARRAY_SIZE)

    # Write the sum to the program output.
    serialize_word(product)

    return ()
end

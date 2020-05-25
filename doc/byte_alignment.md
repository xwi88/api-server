# Go Type

## Ref

- reflect type: `${GOROOT}/src/reflect/type.go:229`
- builtin type: `${GOROOT}/src/builtin/builtin.go`
- [Size_and_alignment_guarantees](https://golang.google.cn/ref/spec#Size_and_alignment_guarantees)

- bool 类型虽然只有一位，但也需要占用1个字节，因为计算机是以字节为单位
- 64为的机器，一个 int 占8个字节
- string string 类型占16个字节，内部包含一个指向数据的指针（8个字节）和一个 int 的长度（8个字节）
- slice 类型占24个字节，内部包含一个指向数据的指针（8个字节）和一个 int 的长度（8个字节）和一个 int 的容量（8个字节）
- map 类型占8个字节，是一个指向 map 结构的指针
- 可以用 `struct{}` 表示空类型，这个类型不占用任何空间，用这个作为 map 的 value，可以将 map 当做 set 来用
- 从Go1.5开始，在一个结构体结尾的一个零长度的字段(一个零长度的数组或者空结构体)要占一个字节。仅且仅最后一个占用字节!
- [具体可参考](https://github.com/xwi88/go-study/blob/master/byte_align/byte_alignment.md) 

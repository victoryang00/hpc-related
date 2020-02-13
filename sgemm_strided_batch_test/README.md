# SGEMMStridedBatch 优化文档
## 编译运行
```bash
make
./lib/sgemm_strided_batch_final -m 512 -n 512 -k 256 --batch_count 10
```
## 生成`sgemm_sqc.co`
```bash
make compile_co
```
## 运行naive案例
```bash
make naive
./lib/sgemm_strided_batch_naive
```
## 运行test案例
```bash
make naive
./lib/sgemm_strided_batch_test
```
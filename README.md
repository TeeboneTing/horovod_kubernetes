# horovod_kubernetes
How to run horovod example code by kubernetes. A tutorial code explained.

# Dockerfile
Copied from horovod orignal [dockerfile](https://github.com/horovod/horovod/blob/master/Dockerfile). I only use PyTorch and Tensorflow so far thus I removed MXNet part in this Dockerfile. You can actually use `horovod/horovod` image on dockerhub.
## Tips:
* Put your command (`horovodrun`) in the last line without adding `-np` or `-H`. This will be handled by k8s MPIJob yaml file.

# Makefile
To build your own image and push to your own repository use.
* build: `make build`
* push: `make push_ubitus` You can change your repository address here.

# horovod_example.yml
Run MPIJob on k8s. Please install [kubeflow MPI job](https://github.com/kubeflow/kubeflow/tree/master/kubeflow/mpi-job) first. Change your image setting for containers. **DO NOT** add commands in yaml file. Run your horovod command in the Dockerfile. 
* replicas: how many machines (workers) you want to use
* resources: set how many GPUs you want to allocate for each machine.
For example: `replica: 4` and `nvidia.com/gpu: 4` means 4 GPUs for each machine and running on 4 machines. (Total 16 GPUs in the k8s cluster.)
## Command:
`kubectl create -f horovod_example.yml`

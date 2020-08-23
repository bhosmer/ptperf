import timeit
import torch

iters = 10000000
runs = 5

t = torch.ones(3, 4)

def run():
    with torch.no_grad():
        for i in range(iters):
            c = t.contiguous()

print(timeit.timeit(run, number=runs))

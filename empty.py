import timeit
import torch

iters = 1000000
runs = 5

def run():
    with torch.no_grad():
        for i in range(iters):
            t = torch.empty(3, 4)

print(timeit.timeit(run, number=runs))

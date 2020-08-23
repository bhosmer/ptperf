import argparse
import timeit
import torch

parser = argparse.ArgumentParser()
parser.add_argument('mode')
args = parser.parse_args()

iters = 1000000
runs = 5

x = torch.ones(3, 4)
y = torch.zeros(3, 4)

# func
def run_func():
    with torch.no_grad():
        for i in range(iters):
            z = torch.add(x, y)

# in
def run_in():
    with torch.no_grad():
        for i in range(iters):
            x.add_(y)

# out
def run_out():
    z = torch.empty(3, 4)
    with torch.no_grad():
        for i in range(iters):
            torch.add(x, y, out=z)

if args.mode == 'fun':
    run = run_func
elif args.mode == 'in':
    run = run_in
elif args.mode == 'out':
    run = run_out
else:
    raise ValueError(f"mode {args.mode}?")

print(timeit.timeit(run, number=runs))

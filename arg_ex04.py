import argparse

parser = argparse.ArgumentParser()
parser.add_argument("square", help="display a square of the given number", type=int)
parser.add_argument("--verbose", help="increase output verbosity")
args = parser.parse_args()
if args.verbose:
    print("verbosity turned on")
print(args.square**2)


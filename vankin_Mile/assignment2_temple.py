'''
    This file contains the template for Assignment2.  For testing it, I will place it
    in a different directory, call the function <vankin_max_score>, and check its output.
    So, you can add/remove  whatever you want to/from this file.  But, don't change the name
    of the file or the name/signature of the following function.

    Also, I will use <python3> to run this code.
'''
import operator
from functools import reduce

max_sum = -99999

def vankin_max_score(input_file_path, output_file_path):
    '''
    This function will ontain your code, it will read the input from the file
    <input_file_path> and write to the file <output_file_path>.

    Params:
        input_file_path (str): full path of the input file.
        output_file_path (str): full path of the output file.
    '''
    f = open(input_file_path)
    input = f.read().split("\n")
    n = int(input[0])
    a = list()
    for i in range(1,len(input)):
        tmp = input[i]
        tmp_a = tmp.split(",")
        aa = list()
        for j in range(len(tmp_a)):
            aa.append(int(tmp_a[j]))
        a.append(aa)
    max_list = [ [-99999] * n for i in range(n)]
    find_largest_sum(n, n - 1, n - 1, a, max_list)
    print(max_sum)
    with open(output_file_path, "w") as file:
        file.write(str(max_sum))

def find_largest_sum(dimension, x, y, array, max_list):
    if max_list[x][y] != -99999:
        return max_list[x][y]
    else:
        if y == 0:
            max_top = 0
        else:
            max_top = find_largest_sum(dimension, x, y - 1, array, max_list)

        if x == 0:
            max_left = 0
        else:
            max_left = find_largest_sum(dimension, x - 1, y, array, max_list)
        current = array[x][y]
        biggest = find_max(max_top + current, max_left + current, current, dimension, x, y)
        max_list[x][y] = biggest
        return biggest

def find_max(up, left, current, dimension, x, y):
    global  max_sum
    temp = up
    if temp < left:
        temp = left
    if temp < current:
        temp = current
    if temp > max_sum:
        if x == dimension - 1 or y == dimension - 1:
            max_sum = temp
    return temp


vankin_max_score('input1.in', 'input1.out')

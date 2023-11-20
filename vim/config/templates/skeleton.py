#!/usr/bin/env python
# -*- coding: utf-8 -*-

import fire
"""
pip install fire

or

echo fire >> requirements.txt
"""

class BrokenCalculator(object):

  def __init__(self, offset=1):
      self._offset = offset

  def add(self, x, y):
    return x + y + self._offset

  def multiply(self, x, y):
    return x * y + self._offset

#  def run():
    #  pass

if __name__ == '__main__':
  fire.Fire(BrokenCalculator)
  run()

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

class TestStringMethods(unittest.TestCase):

    def test_parse_pin(self):
        inp = "X"
        self.assertEqual(parse_pin(inp), 10)

        inp = "/"
        self.assertEqual(parse_pin(inp), 10)

        inp = "-"
        self.assertEqual(parse_pin(inp), 0)

if __name__ == '__main__':
    unittest.main(verbosity=2)

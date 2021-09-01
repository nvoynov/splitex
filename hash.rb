hsh = {}
hsh[:a] = 2
hsh[:b] = 3
hsh[:c] = 1

pp hsh.sort{|(k1, v1), (k2, v2)|
  v2 <=> v1
}

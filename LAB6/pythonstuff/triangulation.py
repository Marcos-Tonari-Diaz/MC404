import math

yb=700
xc=-100
ta=2000
tb=0
tc=2240
tr=2300

da=0.3*(tr-ta)
db=0.3*(tr-tb)
dc=0.3*(tr-tc)
y= math.ceil((da**2+yb**2-db**2)/(2*yb))
y=15
x1 = int(math.sqrt(da**2-y**2))
x2 = -int(math.sqrt(da**2-y**2))
print(x1,x2)
c1 = (x1-xc)**2+y**2-dc**2
c2 = (x2-xc)**2+y**2-dc**2
print (c1, c2)
if abs(c1)< abs(c2):
    x = x1
else:
    x = x2
print (x,y)

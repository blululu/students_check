# This script is used for look for lacking homework's students

If you are looking for a method to find who lacks homework but are not willing to compare one by one,this bash script is for you!
It's usage is easy and listed below.

1.

```
git clone github.com/blululu/students_check.git
cd students_check
```
2.you need edit your model.txt like this
```
jane
peter
frank
james
```

3.
```
./students_check.sh /collecting/homework/directory
```
## Example:
```
./students_check.sh sample/
```
Output:
>-----Lacking--Students-----
>peter
>total:1
>---Dumplicated--files------

## License
GPLV2

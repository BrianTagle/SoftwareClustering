# SoftwareClustering

Follow README instructions in HGCN and java-callgraph directories for setting up those modules.  

java-callgraph is written in java and is used to analyze .jar or .class files staticlly or dynamically to generate a callgraph.

HGCN is written in python and requires anaconda to setup.  HGCN is used to generate embeddings in the hyperbolic space.  In this project we use hyperbolic embeddings to attempt to cluster modules based on embedding geenerated from a programs callgraph.

To create the callgraph, follow the instructions to buiild the java program.  Then in java-callgraph/target

```
./create_callgraph.sh $DIRECTORY_NAME
```
where $DIRECTORY_NAME is the name of the directory containing the jar files you want to analyze.
This will generate a callgraph, cgraph.txt in the call_graph directory.

After doing any processing of the callgraph using

###TO BE UPLOADED, DATA PROCESSING CODE

You can use HGCN to generate hyperbolic embeddings using the following command

```
python train.py --task rec --dataset junit --model Shallow --manifold PoincareBall --lr 0.01 --weight-decay 0.0005 --dim 16 --num-layers 0 --use-feats 0 --dropout 0.2 --act None --bias 0 --optimizer RiemannianAdam --cuda -1 --test-prop 0 --val-prop 0 --save 1 --epochs 2000
```
If you want to visualize the data, It is recommended to using --dim 2

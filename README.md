# SoftwareClustering

Follow README instructions in HGCN, and HypHC and java-callgraph directories for setting up those modules.  After setting them up you can follow this readme to perform the experiments from [our paper](https://www.overleaf.com/read/xsdbqvmxqpkj)

java-callgraph is written in java and is used to analyze .jar or .class files staticlly or dynamically to generate a callgraph. credit to https://github.com/gousiosg/java-callgraph for the original code.

HGCN is written in python and requires anaconda to setup.  HGCN is used to generate embeddings in the hyperbolic space for K-Means.  In this project we use hyperbolic embeddings to attempt to cluster modules based on embedding geenerated from a programs callgraph. credit to https://github.com/HazyResearch/hgcn for the original code

HypHC is written in python and takes the similarity scores of objects to generate a binary tree in hyperbolic space.  We use this for the hyperbolic hiearchical clustering. credit to https://github.com/HazyResearch/HypHC for the original code

To create the callgraph, follow the instructions to buiild the java program.  Then in java-callgraph/target

```
./create_callgraph.sh $DIRECTORY_NAME
```
where $DIRECTORY_NAME is the name of the directory containing the jar files you want to analyze.
This will generate a callgraph, cgraph.txt in the call_graph directory.

After doing any processing of the callgraph using our juypter notebook data processing code which is available on google colab at https://drive.google.com/drive/folders/1nIaXadQy-wEovO_0Qc-0330u7ISVEF3u?usp=sharing
## Hyperbolic K-Means
You can use HGCN to generate hyperbolic embeddings for K-Means using the following command after navigating to the HGCN directory


```
python train.py --task rec --dataset junit --model Shallow --manifold PoincareBall --lr 0.01 --weight-decay 0.0005 --dim 16 --num-layers 0 --use-feats 0 --dropout 0.2 --act None --bias 0 --optimizer RiemannianAdam --cuda -1 --test-prop 0 --val-prop 0 --save 1 --epochs 1500
```

You can also use HCGN   to generate the euclidean embeddings using the following command
```
python train.py --task rec --dataset junit --model Shallow --manifold Euclidean --lr 0.01 --weight-decay 0.0005 --dim 16 --num-layers 0 --use-feats 0 --dropout 0.2 --act None --bias 0 --optimizer Adam --cuda -1 --test-prop 0 --val-prop 0 --save 1 --epochs 1500
```
You can change the dimensionality of the embedding by changing the --dim argument
You can change from using the junit or guava dataset by changing the --dataset argument to junit or guava

Finally you can navigate to our [google colab notebook](https://drive.google.com/drive/folders/1nIaXadQy-wEovO_0Qc-0330u7ISVEF3u?usp=sharing) and run the experiments in the K-Means Clustering notebook

## Hyperbolic Hiearchical Clustering
To create the hyperbolic embeddings for hiearchical clustering you can navigate to the HypHC directory and run

```
source examples/run_junit.sh
```
or for guava
```
source examples/run_junit.sh
```

To create visualizations for the hiearchical clustering you can run visualize.py with two arguments, the path to the embeddings which are default saved to the embedding directory and the seed used to generate the embeddings which defaults to 0.

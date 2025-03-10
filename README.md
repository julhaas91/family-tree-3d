# Family Tree 3D
A 3D visualization of my extended family tree.

## Installation
```bash
git clone https://github.com/julhaas91/family-tree-3d.git && cd family-tree-3d  
npm install  
npm start  
```

## Google Cloud Deployment
To deploy the family tree as a static website:
1. Provide a GED file in `family-tree-3d/src/gedcoms/family.ged` 
2. Provide a thumbnail Logo in `family-tree-3d/src/img/logo.png` 
3. Run:
```bash
./taskfile.sh create '<your-family-tree>' (e.g. 'julius-family-tree-3d')
```

## Update
To update the family tree and redeploy as a static website:
1. Provide an updated GED file in `family-tree-3d/src/gedcoms/family.ged` 
2. Provide an updated thumbnail Logo in `family-tree-3d/src/img/logo.png` 
3. Run:
```bash
./taskfile.sh update '<your-family-tree>' (e.g. 'julius-family-tree-3d')
```
## Credits
This project is based on [Blood Lines](https://github.com/oh-kay-blanket/blood-lines), a family tree visualization tool using [3D Force-Directed Graph](https://github.com/vasturiano/3d-force-graph).

Blood Lines relies on [GEDCOM-d3](https://github.com/oh-kay-blanket/gedcom-d3), a custom GEDCOM parser derived from [tmcw/parse-gedcom](https://github.com/tmcw/gedcom).

## About GEDCOM
[GEDCOM](https://github.com/tmcw/gedcom) is a standard for exchanging genealogical data across different software. Most genealogy programs allow exporting family trees as GEDCOM files.

If you’re new to genealogy, I recommend [GRAMPS](https://github.com/gramps-project/gramps), a free, open-source tool for creating and managing family trees.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

> For inquiries, feel free to contact me via [email](mailto:juliushaas91@gmail.com) or [LinkedIn](https://www.linkedin.com/in/jh91/) 
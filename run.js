'use strict';

const fs = require('fs');
const files = fs.readdirSync(__dirname);
const ignorePaths = [
  '.git', 
  '.gitignore', 
  'README.md',
  'git_submodule_init.sh',
  '.gitmodules',
  'package.json',
  'run.js',
  'npm-debug.log'
];

const dotfiles = files.filter((file) => ignorePaths.indexOf(file) < 0);

console.log('find dotfiles \n %s', JSON.stringify(dotfiles, null, 2));

dotfiles.forEach((fileOrDir) => {
  const dotSymLink = `${process.env.HOME}/${fileOrDir}`;
  try {
    fs.statSync(dotSymLink);
    console.warn('sym link %s is exist', dotSymLink);
  } catch(_) {
    if(_.code !=='ENOENT') {
      console.error(_);
      return;
    }
    
    console.log('sym link fileOrDir %s', fileOrDir);
    fs.symlinkSync(`${__dirname}/${fileOrDir}`, dotSymLink);
  }
})

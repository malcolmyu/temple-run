/** Compile a TS fixture to an evaluable expression; output is a disposable build artifact. */
import {readFile,writeFile} from 'node:fs/promises';
import {resolve} from 'node:path';
import {pathToFileURL} from 'node:url';
import {transform} from 'esbuild';
export async function compileBrowserTest(input:string):Promise<string>{
 const source=await readFile(resolve(input),'utf8');
 return (await transform(source,{loader:'ts',target:'es2022',sourcefile:input})).code;
}
if(process.argv[1]&&import.meta.url===pathToFileURL(resolve(process.argv[1])).href){
 const [input,output]=process.argv.slice(2);
 if(!input)throw Error('Usage: node tools/compile-browser-test.ts input.ts [output.js]');
 const code=await compileBrowserTest(input);
 if(output)await writeFile(output,code);else process.stdout.write(code);
}

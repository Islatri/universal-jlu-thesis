#!/usr/bin/env node

const fs = require('node:fs');
const path = require('node:path');

class TemplateBuilder {
    constructor() {
        this.rootDir = __dirname;
        this.examplesDir = path.join(this.rootDir, 'examples');
        this.outputDir = path.join(this.rootDir, 'template');
        this.outputFile = path.join(this.outputDir, 'jlu-bachelor-thesis.typ');
        
        if (!fs.existsSync(this.outputDir)) {
            fs.mkdirSync(this.outputDir, { recursive: true });
        }
    }

    copyTemplateFile() {
        const sourceFile = path.join(this.examplesDir, 'bachelor-example.typ');
        
        if (!fs.existsSync(sourceFile)) {
            throw new Error(`Source template file not found: ${sourceFile}`);
        }
        
        console.log('📄 Copying template file...');
        console.log(`  From: ${sourceFile}`);
        console.log(`  To: ${this.outputFile}`);
        
        fs.copyFileSync(sourceFile, this.outputFile);
    }

    copyBibFile() {
        const sourceBib = path.join(this.examplesDir, 'refs.bib');
        const outputBib = path.join(this.outputDir, 'refs.bib');
        
        if (fs.existsSync(sourceBib)) {
            console.log('📚 Copying bibliography file...');
            console.log(`  From: ${sourceBib}`);
            console.log(`  To: ${outputBib}`);
            
            fs.copyFileSync(sourceBib, outputBib);
        } else {
            console.log('⚠️  Bibliography file not found, skipping...');
        }
    }

    copyAssets() {
        const assetsDir = path.join(this.examplesDir, 'assets');
        const outputAssetsDir = path.join(this.outputDir, 'assets');
        
        if (fs.existsSync(assetsDir)) {
            console.log('📁 Copying assets...');
            console.log(`  From: ${assetsDir}`);
            console.log(`  To: ${outputAssetsDir}`);
            
            this.copyDirectorySync(assetsDir, outputAssetsDir);
        } else {
            console.log('⚠️  Assets directory not found, skipping...');
        }
    }

    copyDirectorySync(src, dest) {
        if (!fs.existsSync(dest)) {
            fs.mkdirSync(dest, { recursive: true });
        }
        
        const entries = fs.readdirSync(src, { withFileTypes: true });
        for (const entry of entries) {
            const srcPath = path.join(src, entry.name);
            const destPath = path.join(dest, entry.name);
            
            if (entry.isDirectory()) {
                this.copyDirectorySync(srcPath, destPath);
            } else {
                fs.copyFileSync(srcPath, destPath);
                console.log(`    📎 ${entry.name}`);
            }
        }
    }

    validateExamplesDirectory() {
        if (!fs.existsSync(this.examplesDir)) {
            throw new Error(`Examples directory not found: ${this.examplesDir}`);
        }
        
        const requiredFiles = ['bachelor-example.typ'];
        const missingFiles = requiredFiles.filter(file => 
            !fs.existsSync(path.join(this.examplesDir, file))
        );
        
        if (missingFiles.length > 0) {
            throw new Error(`Missing required files in examples directory: ${missingFiles.join(', ')}`);
        }
    }

    build() {
        console.log('🚀 Building JLU Thesis Template...');
        console.log(`📂 Source: ${this.examplesDir}`);
        console.log(`📂 Output: ${this.outputDir}`);
        console.log('');
        
        try {
            // 验证源目录和文件
            this.validateExamplesDirectory();
            
            // 复制主模板文件 (bachelor-example.typ -> bachelor-thesis.typ)
            this.copyTemplateFile();
            
            // 复制参考文献文件
            this.copyBibFile();
            
            // 复制资源文件
            this.copyAssets();
            
            console.log('');
            console.log('✅ Template built successfully!');
            console.log(`📄 Main template: ${this.outputFile}`);
            console.log('');
            console.log('💡 Usage:');
            console.log('  cd template');
            console.log('  typst compile bachelor-thesis.typ');
            console.log('  typst watch bachelor-thesis.typ');
            
        } catch (error) {
            console.error('❌ Build failed:', error.message);
            process.exit(1);
        }
    }
}

if (require.main === module) {
    const builder = new TemplateBuilder();
    builder.build();
}
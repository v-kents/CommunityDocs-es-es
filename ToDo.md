# Repo for MSDN & Technet Library Spanish-speaking community project (formerly known as MINITEL)

##TODO (now): 
- DONE -> we should probably remove the /articles/ folder and just put topic-specific folders one level up (to reduce length of URL)
- DONE -> rethink about the repo name "Community" in light of the fact that 
    - now CommunityDocs both for MSDN and technet
- DONE - check limitations of usage with non-ASCII charcters - especially on the URL
    - no issues in general - only watch out for strange characters on the files/folder names
- DONE - automate conversion of all Spanish articles from docx to md (with Pandoc)
    - converted automatically - mostly OK but with some minor corrections needed - mainly
        - remap images to new folder structure
        - conversion adds {width=...} metadata to images - need to remove that
        - code blocks - special characters are escaped (e.g. \\\*) but codeblocks don't need escaping
        - missing metadata
- DONE - automate creation of TOC.md(s) based on existing .HxT files
    - script in /Tools folder 
    - revriew manually for correctness and order (sorting)
- DONE - check whether it's better to keep one single TOC.md file or to split it in Main + Sub-TOCs (.yml files - check [this article](http://dotnet.github.io/docfx/tutorial/intro_toc.html) )
    - OK to use split TOC.md files - one per folder
    - however please note that it is sufficient to break one Sub/TOC.md file to break the whole TOC
- Finish converting all articles
    - Spanish Done
- create final TOC
    - SPanish Done
- create redirection mapping between existing articles in library and new articles
- get final repo (not sandbox) and move the whole contentset & structure
    - Spanish Done

- **new:** [template here](./template.md)
  - template includes metadata
  - metadata have been included in all articles that are live - need to measure 

##Next Steps (not done yet, but immediately after the TODO)
    - Spanish Readme file with instructions Done

##Next Next (future evolutions / ideas)
- need to figure out how we can best leverage this platform in conjunction with comments and BI to create a single dashboard to track customer interest and feedback on these

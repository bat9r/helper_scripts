## General structure
```groovy
parameters([
    [$class: 'ChoiceParameter',
        // Choice type.
        choiceType: [string],
        // Filter flag.
        filterable: [boolean],
        // Filter length. Defines a minimum number of characters
        // that must be entered before the filter is activated.
        filterLength: [integer], 
        // TODO
        script: [$class: '[class name]',
                 [paramete1], [parameterN]
                 ]
    ]
])    

```
### choiceType
```
PT_SINGLE_SELECT
PT_MULTI_SELECT
PT_RADIO
PT_CHECKBOX
```

### script
Classes:
- GroovyScript  
    - Parameters
        - `script` - Script content [string]
        - `secureScript` - Secure script content.
        - `fallbackScript` - fallbackScript
        - `secureFallbackScript` - Secure fallback script content.

- ScriptlerScript
 

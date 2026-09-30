# SFT dataset — token statistics

Tokenized with `JacLLM-SFT-Ornith-9B-v1.2/tokenizer.json` (vocab 248,320).  
Counts cover raw `messages[].content` concatenation; chat-template wrapping adds ~10–30 tokens per row.

## Per-file summary

| Dataset | Rows | Avg tokens/row | Total tokens |
|---|---:|---:|---:|
| `code_completion/Nitin-9k-py2jac-idiom/train.jsonl` | 6,888 | 193.8 | 1,335,130 |
| `code_gen/opus-synth-v2/train.jsonl` | 1,841 | 544.2 | 1,001,937 |
| `farm/Nitin-2k-farm/train.jsonl` | 1,385 | 677.1 | 937,775 |
| `js2jac/Nitin-3k-js2jac-idiom/train.jsonl` | 2,402 | 760.0 | 1,825,441 |
| `osp/Nitin-1k-osp/train.jsonl` | 828 | 705.1 | 583,798 |
| `py2jac/opus-synth-v2/train.jsonl` | 400 | 210.4 | 84,173 |
| `qa/opus-synth-v2/train.jsonl` | 4,292 | 367.0 | 1,575,087 |
| `scaffold2impl/Rui-jacapp-scaffold/train.jsonl` | 105 | 1,957.3 | 205,516 |
| **Total** | **18,141** | **416.1** | **7,548,857** |

## `code_completion/Nitin-9k-py2jac-idiom`

6,888 rows · avg 193.8 tok · total 1,335,130 tok

### Sample 1 (111 tokens)

- **Meta:** `source`=code, `format`=jac, `class`=function, `task_type`=code_completion, `fp`=357821

#### System

You are an expert AI assistant specializing in the jac programming language.

#### User

Given the docstring and imports below, write the full Jac implementation:
```
"""Converts text that may be underscored into a camelcase format"""
def camelcase_text(text: str) -> str {
```
#### Assistant

```jac
"""Converts text that may be underscored into a camelcase format"""
def camelcase_text(text: str) -> str {
    return text[0] + "".join(text.title().split('_'))[1:];
}
```

---

### Sample 2 (208 tokens)

- **Meta:** `source`=code, `format`=jac, `class`=function, `task_type`=code_completion, `fp`=23747

#### System

You are an expert AI assistant specializing in the jac programming language.

#### User

Here is the start of a Jac function. Complete it and return the whole file wrapped in ```jac ... ```.
```
"""
Creates the output filename.

Args:
dataset_dir: The dataset directory where the dataset is stored.
split_name: The name of the train/test split.

Returns:
An absolute file path.
"""
def _get_output_filename(dataset_dir: str, split_name: str) -> str {
```
#### Assistant

```jac
"""Creates the output filename.

    Args:
    dataset_dir: The dataset directory where the dataset is stored.
    split_name: The name of the train/test split.

    Returns:
    An absolute file path.
    """
def _get_output_filename(dataset_dir: str, split_name: str) -> str {
    return '%s/cifar10_%s.tfrecord' % (dataset_dir, split_name);
}
```

---

## `code_gen/opus-synth-v2`

1,841 rows · avg 544.2 tok · total 1,001,937 tok

### Sample 1 (121 tokens)

- **Meta:** `source`=agent, `format`=jac, `task_type`=code_gen, `fp`=174ba4452e38__cl_component_authoring__1, `class`=fullstack, `category`=code_gen, `subtype`=cl_component_authoring

#### User

UserPanel: try/awaiting/except JSX -- card on success, skeleton while pending, an error card on exception.

#### Assistant

```jac
cl {
    def:pub UserPanel(user: User) -> JsxElement {
        return <section class="panel">
            {try {
                <UserCardView user={user}/>
            } awaiting {
                <UserCardSkeleton/>
            } except Exception {
                <div class="card error">Couldn't load this user.</div>
            }}
        </section>;
    }
}
```

---

### Sample 2 (384 tokens)

- **Meta:** `source`=agent, `format`=jac, `task_type`=code_gen, `fp`=1a11e59ff75a__node_edge_definition__1, `class`=graph, `category`=code_gen, `subtype`=node_edge_definition

#### User

get_all_profiles gather on Profile entry: self.results.append(here.to_user_view()).

#### Assistant

```jac
"""RL driver (graph): social_graph.get_all_profiles.gather.

Origin: this_is_jac/littlex/social_graph.jac. `get_all_profiles` fans out over
every root's profiles and `gather` accumulates each as a user view, delivered
once at exit. The marked body is `gather`; the entry block builds one profile so
allroots output is stable and prints the sorted usernames.
"""

obj UserView { has id: str, username: str, bio: str = ""; }

edge Follow {}

node Profile {
    has username: str = "", bio: str = "", created_at: str = "";

    def to_user_view -> UserView {
        return UserView(id="", username=self.username, bio=self.bio);
    }
}

walker get_all_profiles {
    has results: list[UserView] = [], reports: list[list[UserView]] = [];

    can run with Root entry {
        for r in allroots() {
            visit [r-->[?:Profile]];
        }
    }

    can gather with Profile entry {
        # >>>HOLE id="sg_get_all_profiles_gather" instruction="Implement the gather ability (walker get_all_profiles, on Profile entry). Append here.to_user_view() to self.results."
        self.results.append(here.to_user_view());
        # <<<HOLE
    }

    can deliver with Root exit {
        report self.results;
    }
}

with entry {
    root ++> Profile(username="alice");
    res = root spawn get_all_profiles();
    print("usernames:", sorted([u.username for u in res.reports[0]]));
}

```

---

## `farm/Nitin-2k-farm`

1,385 rows · avg 677.1 tok · total 937,775 tok

### Sample 1 (528 tokens)

- **Meta:** `source`=agent, `format`=jac, `class`=function, `task_type`=farm, `fp`=ShmuelRozental_Global_Terrorism_Database__fast_app_api_models_event_py::WeaponType

#### System

You are an expert jac language assistant. Provide syntatically correct Jac code inside ```jac code blocks when applicable.

#### User

Write Jac walker:pub definitions to create, list, delete, and update 'WeaponType' instances given this schema. Respond only with ```jac ... ```.

```jac
node Date {
    has year: int;
    has month: int | None = None;
    has day: int | None = None;
}

node Location {
    has country: str;
    has region_id: int;
    has region: str;
    has city: str | None = None;
    has lat: float | None = None;
    has lon: float | None = None;
}

node TargetType {
    has target_type_id: int;
    has target_type_name: str;
}

node AttackType {
    has attack_type_id: int;
    has attack_type_name: str;
}

node Casualties {
    has fatalities: float | None = None;
    has injuries: float | None = None;
}

node WeaponType {
    has weapon_type_id: int;
    has weapon_type_name: str;
}

node TerroristGroup {
    has group_name: str;
}

node EventModel {
    has location: str;
    has date: str;
    has target_type: str;
    has attack_type: str;
    has casualties: str;
    has number_of_terrorists: float | None = None;
    has summary: str | None = None;
    has weapon_type: str | None = None;
    has terrorist_group: str | None = None;
}
```

#### Assistant

```jac
walker:pub create_WeaponType {
    has weapon_type_id: int; has weapon_type_name: str;
    can go with Root entry {
        new = here ++> WeaponType(weapon_type_id=self.weapon_type_id, weapon_type_name=self.weapon_type_name);
        report new;
    }
}
walker:pub list_WeaponType { can go with Root entry { report [-->[?:WeaponType]]; } }
walker:pub update_WeaponType { has val: int; can go with WeaponType entry { here.weapon_type_id = self.val; report here; } }
walker:pub delete_WeaponType { can go with WeaponType entry { del here; report "deleted"; } }
```

---

### Sample 2 (398 tokens)

- **Meta:** `source`=agent, `format`=jac, `class`=function, `task_type`=farm, `fp`=xiejoshua_auxd_legacy__apps_api_src_auxd_api_modules_backlog_models_py::Backlog

#### System

You are an expert jac language assistant. Provide syntatically correct Jac code inside ```jac code blocks when applicable.

#### User

From the schema below, generate the CRUD walker set for 'Backlog' — create/list/delete/update. Return the code inside a ```jac``` block.

```jac
node Backlog {
    has user_id: str;
    has created_at: str;
    has updated_at: str;
    has _schema_version: int = 1;
    has keep_after_logging: bool = False;
}

node BacklogItem {
    has backlog_id: str;
    has album_id: str;
    has position: int;
    has added_at: str;
    has _schema_version: int = 1;
    has per_item_visibility: str | None = None;
    has notes: str | None = None;
}
```

#### Assistant

```jac
walker:pub create_Backlog {
    has _schema_version: int;
    has user_id: str;
    has keep_after_logging: bool;
    has created_at: str;
    has updated_at: str;
    can go with Root entry {
        new = here ++> Backlog(
            _schema_version=self._schema_version,
            user_id=self.user_id,
            keep_after_logging=self.keep_after_logging,
            created_at=self.created_at,
            updated_at=self.updated_at
        );
        report new;
    }
}
walker:pub list_Backlog { can go with Root entry { report [-->[?:Backlog]]; } }
walker:pub update_Backlog { has val: bool; can go with Backlog entry { here.keep_after_logging = self.val; report here; } }
walker:pub delete_Backlog { can go with Backlog entry { del here; report "deleted"; } }
```

---

## `js2jac/Nitin-3k-js2jac-idiom`

2,402 rows · avg 760.0 tok · total 1,825,441 tok

### Sample 1 (1,295 tokens)

- **Meta:** `source`=code, `format`=jac, `class`=function, `task_type`=js2jac, `fp`=moollaza__repo-remover::components/scrolling-quotes.tsx

#### System

You are an expert AI assistant specializing in the jac programming language.

#### User

Given this JS/TS source, write the equivalent Jac. Respond with a ```jac ... ``` code block only.
```ts
import clsx from "clsx";
import { useEffect, useState } from "react";

import styles from "./scrolling-quotes.module.css";

interface Quote {
  author: string;
  source: string;
  sourceName: string;
  text: string;
}

const quotes: Quote[] = [
  {
    author: "CodeNinja42",
    source: "https://twitter.com/CodeNinja42",
    sourceName: "Twitter",
    text: "Cleaning up old repos is like digital spring cleaning for devs.",
  },
  {
    author: "DevOpsGuru",
    source: "https://github.com/DevOpsGuru",
    sourceName: "GitHub",
    text: "Repo Remover saved me hours of manual work. Highly recommended!",
  },
  {
    author: "GitMaster",
    source: "https://linkedin.com/in/GitMaster",
    sourceName: "LinkedIn",
    text: "Finally, a tool that understands the struggle of repo management.",
  },
  {
    author: "CleanCodeAdvocate",
    source: "https://dev.to/CleanCodeAdvocate",
    sourceName: "Dev.to",
    text: "Decluttering my GitHub has never been easier. Thanks, Repo Remover!",
  },
];

export function ScrollingQuotes() {
  const [shuffledQuotes, setShuffledQuotes] = useState<Quote[]>([]);
  const [isPaused, setIsPaused] = useState(false);
  const [reduceMotion, setReduceMotion] = useState(false);

  useEffect(() => {
    const shuffled = [...quotes].sort(() => Math.random() - 0.5);
    setShuffledQuotes(shuffled);
  }, []);

  useEffect(() => {
    // Check for reduced motion preference
    const prefersReducedMotion = window.matchMedia(
      "(prefers-reduced-motion: reduce)",
    ).matches;

    setReduceMotion(prefersReducedMotion);
  }, []);

  return (
    <div
      aria-label="Scrolling quotes"
      className={clsx("w-full", reduceMotion && "no-animations")}
      onMouseEnter={() => !reduceMotion && setIsPaused(true)}
      onMouseLeave={() => !reduceMotion && setIsPaused(false)}
    >
      <div
        className={clsx(
          "flex gap-6",
          styles.scrolling,
          isPaused && styles.paused,
        )}
        style={{
          width: `${shuffledQuotes.length * 320 * 2}px`,
        }}
      >
        {[...shuffledQuotes, ...shuffledQuotes].map((quote, index) => (
          <a
            className={clsx(
              "w-72 flex-shrink-0 cursor-pointer",
              !reduceMotion &&
                "transition-transform duration-300 ease-in-out hover:scale-105",
            )}
            href={quote.source}
            key={index}
            rel="noopener noreferrer"
            target="_blank"
          >
            <div className="h-full rounded-lg bg-success-50 text-success-900 shadow-md flex flex-col">
              <div className="relative p-3 flex-grow">
                <div className="absolute top-2 left-2 text-8xl text-success opacity-10 font-serif">
                  &ldquo;
                </div>
                <blockquote className="m-0 flex flex-col">
                  <p className="text-foreground pt-6 ml-4 px-2 italic flex-grow">
                    {quote.text}
                  </p>
                  <footer className="mt-4 text-sm text-foreground-500">
                    — <cite>{quote.author}</cite>
                  </footer>
                </blockquote>
              </div>
              <div className="flex justify-between items-center px-3 py-2 border-t border-success-200">
                <span className="text-xs text-success-700 opacity-50">
                  {quote.sourceName}
                </span>
              </div>
            </div>
          </a>
        ))}
      </div>
    </div>
  );
}
```

#### Assistant

```jac
import from "clsx" { default as clsx }
import from "./scrolling-quotes.module.css" { default as styles }

obj Quote {
    has author: str;
    has source: str;
    has sourceName: str;
    has text: str;
}

glob quotes: list[Quote] = [
    Quote(
        author="CodeNinja42",
        source="https://twitter.com/CodeNinja42",
        sourceName="Twitter",
        text="Cleaning up old repos is like digital spring cleaning for devs.",
    ),
    Quote(
        author="DevOpsGuru",
        source="https://github.com/DevOpsGuru",
        sourceName="GitHub",
        text="Repo Remover saved me hours of manual work. Highly recommended!",
    ),
    Quote(
        author="GitMaster",
        source="https://linkedin.com/in/GitMaster",
        sourceName="LinkedIn",
        text="Finally, a tool that understands the struggle of repo management.",
    ),
    Quote(
        author="CleanCodeAdvocate",
        source="https://dev.to/CleanCodeAdvocate",
        sourceName="Dev.to",
        text="Decluttering my GitHub has never been easier. Thanks, Repo Remover!",
    ),
];
```

---

### Sample 2 (1,236 tokens)

- **Meta:** `source`=code, `format`=jac, `class`=function, `task_type`=js2jac, `fp`=vanxh__openbio::components/ui/form.tsx

#### System

You are a helpful assistant.

#### User

Convert the following JavaScript/TypeScript code into Jac. Return only a ```jac ... ``` block:
```ts
import { Label } from '@/components/ui/label';
import { cn } from '@/lib/utils';
import type * as LabelPrimitive from '@radix-ui/react-label';
import { Slot } from '@radix-ui/react-slot';
import * as React from 'react';
import {
  Controller,
  type ControllerProps,
  type FieldPath,
  type FieldValues,
  FormProvider,
  useFormContext,
} from 'react-hook-form';

const Form = FormProvider;

type FormFieldContextValue<
  TFieldValues extends FieldValues = FieldValues,
  TName extends FieldPath<TFieldValues> = FieldPath<TFieldValues>,
> = {
  name: TName;
};

const FormFieldContext = React.createContext<FormFieldContextValue>(
  {} as FormFieldContextValue
);

const FormField = <
  TFieldValues extends FieldValues = FieldValues,
  TName extends FieldPath<TFieldValues> = FieldPath<TFieldValues>,
>({
  ...props
}: ControllerProps<TFieldValues, TName>) => {
  return (
    <FormFieldContext.Provider value={{ name: props.name }}>
      <Controller {...props} />
    </FormFieldContext.Provider>
  );
};

const useFormField = () => {
  const fieldContext = React.useContext(FormFieldContext);
  const itemContext = React.useContext(FormItemContext);
  const { getFieldState, formState } = useFormContext();

  const fieldState = getFieldState(fieldContext.name, formState);

  if (!fieldContext) {
    throw new Error('useFormField should be used within <FormField>');
  }

  const { id } = itemContext;

  return {
    id,
    name: fieldContext.name,
    formItemId: `${id}-form-item`,
    formDescriptionId: `${id}-form-item-description`,
    formMessageId: `${id}-form-item-message`,
    ...fieldState,
  };
};

type FormItemContextValue = {
  id: string;
};

const FormItemContext = React.createContext<FormItemContextValue>(
  {} as FormItemContextValue
);

const FormItem = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => {
  const id = React.useId();

  return (
    <FormItemContext.Provider value={{ id }}>
      <div ref={ref} className={cn('space-y-2', className)} {...props} />
    </FormItemContext.Provider>
  );
});
FormItem.displayName = 'FormItem';

const FormLabel = React.forwardRef<
  React.ElementRef<typeof LabelPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof LabelPrimitive.Root>
>(({ className, ...props }, ref) => {
  const { error, formItemId } = useFormField();

  return (
    <Label
      ref={ref}
      className={cn(error && 'text-destructive', className)}
      htmlFor={formItemId}
      {...props}
    />
  );
});
FormLabel.displayName = 'FormLabel';

const FormControl = React.forwardRef<
  React.ElementRef<typeof Slot>,
  React.ComponentPropsWithoutRef<typeof Slot>
>(({ ...props }, ref) => {
  const { error, formItemId, formDescriptionId, formMessageId } =
    useFormField();

  return (
    <Slot
      ref={ref}
      id={formItemId}
      aria-describedby={
        error ? `${formDescriptionId} ${formMessageId}` : `${formDescriptionId}`
      }
      aria-invalid={!!error}
      {...props}
    />
  );
});
FormControl.displayName = 'FormControl';

const FormDescription = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, ...props }, ref) => {
  const { formDescriptionId } = useFormField();

  return (
    <p
      ref={ref}
      id={formDescriptionId}
      className={cn('text-[0.8rem] text-muted-foreground', className)}
      {...props}
    />
  );
});
FormDescription.displayName = 'FormDescription';

const FormMessage = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, children, ...props }, ref) => {
  const { error, formMessageId } = useFormField();
  const body = error ? String(error?.message) : children;

  if (!body) {
    return null;
  }

  return (
    <p
      ref={ref}
      id={formMessageId}
      className={cn('font-medium text-[0.8rem] text-destructive', className)}
      {...props}
    >
      {body}
    </p>
  );
});
FormMessage.displayName = 'FormMessage';

export {
  useFormField,
  Form,
  FormItem,
  FormLabel,
  FormControl,
  FormDescription,
  FormMessage,
  FormField,
};
```

#### Assistant

```jac
import from "@/components/ui/label" { Label }
import from "@/lib/utils" { cn }
import from "@radix-ui/react-slot" { Slot }
import from "react-hook-form" { Controller, FormProvider, useFormContext }

glob:pub Form = FormProvider;
```

---

## `osp/Nitin-1k-osp`

828 rows · avg 705.1 tok · total 583,798 tok

### Sample 1 (1,295 tokens)

- **Meta:** `source`=agent, `format`=jac, `class`=osp, `task_type`=osp, `fp`=iss_thcuba__HAOS-hermes-agent__2155

#### User
```
A maintainer on the project thcuba/HAOS-hermes-agent (unknown) filed this issue about hand-rolled graph machinery causing pain:

Issue #2155: Anomaly Detected: Pipeline di Deployment in branch main

## Summary of Anomaly
An error was detected in the build process of **HAOS-hermes-agent**!

- **Workflow**: Deploy Site (#58)
- **Commit**: fix(ci): resolve ty panic and core type diagnostics (#2142)

- Resolve `ty` panic in `checkpoint_manager.py` by using an iterative
  approach and breaking type inference cycles with local variables.
- Fix type-hinting issues in `agent_runtime_helpers.py` and
  `anthropic_adapter.py` for better consistency and compatibility.
- Suppress `unresolved-import` for optional dependencies (`fal_client`,
  `modal`, `daytona`, `lark_oapi`) to reduce CI noise.
- Ensure all modified files pass static analysis via `ty check`.
- Verify correctness with existing test suite (all relevant tests passed).

Co-authored-by: google-labs-jules[bot] <161369871+google-labs-jules[bot]@users.noreply.github.com> (`6a6244a31ff92fb14aa588a2f92700b0625fc85a`)
            - **Author**: Jules
            - **Branch/Ref**: `main`
            - **Timestamp**: 2026-06-22 03:05:15

            ### Log Details
            - **Failed Component**: `Pipeline di Deployment`
            - **File**: `app/build.gradle.kts` (Line N/A)
            - **Severity**: `DEPLOY_ERROR`

            ### Diagnostics
            ```
            Errore Google Play: il versionCode specificato è già presente su Google Play Console.
            ```

            ### Recommendation
            Incrementa il valore numerico di versionCode in app/build.gradle.kts ed esegui nuovamente il commit.

            ---
            *Automatically generated by DevMonitor-App AI Automation.*

Write a small self-contained Jac demo program that models the essential scenario from this issue natively: pick the 2-4 core entity types as node archetypes with typed has fields, connect instances with edges (typed edges where the relationship carries meaning), and implement walker(s) that perform the traversal the issue complains about (e.g. recursion over parents/children, cascade delete or invalidation, dependency ordering, cycle detection, reachability). Wire a small demonstration graph in a `with entry` block and spawn the walker(s). No I/O, no external libraries, no pytest blocks.
```
#### Assistant

```jac
"""Deployment pipeline trace: commit → CI → build → deploy to Play Console.

Models the recurring anomaly where a build succeeds locally but the deploy
step fails because versionCode in build.gradle.kts collides with one already
present in Google Play Console. A walker walks the typed pipeline edges and
reports the deploy step that is blocked by the conflict.
"""

node Commit {
    has sha: str = "";
    has title: str = "";
}

node CI {
    has name: str = "";
    has passed: bool = True;
}

node Build {
    has artifact: str = "";
    has version_code: int = 0;
}

node PlayRelease {
    has track: str = "production";
    has known_version_codes: list[int] = [];
}

edge Triggers { }
edge Produces { }
edge Targets { }

walker PipelineTrace {
    has conflict_version: int = 0;
    has blocked_target: str = "";

    can start with Root entry {
        visit [->:Triggers:->];
    }

    can run_ci with Commit entry {
        print(f"commit {here.sha}: {here.title}");
        visit [->:Produces:->];
    }

    can build_artifact with CI entry {
        status = "OK" if here.passed else "FAIL";
        print(f"  CI [{here.name}] {status}");
        if not here.passed {
            disengage;
        }
        visit [->:Produces:->];
    }

    can publish with Build entry {
        print(f"  build artifact={here.artifact} versionCode={here.version_code}");
        if here.version_code == self.conflict_version {
            self.blocked_target = here.artifact;
            print(f"  BLOCKED: versionCode {here.version_code} already on Play Console");
        }
        visit [->:Targets:->];
    }

    can land with PlayRelease entry {
        if self.blocked_target != "" {
            print(f"deploy to {here.track} rejected for {self.blocked_target}; "
                  f"known codes: {here.known_version_codes}");
        } else {
            print(f"deploy to {here.track} clean (known codes: {here.known_version_codes})");
        }
        disengage;
    }
}

with entry {
    fix_commit = Commit(
        sha="6a6244a",
        title="fix(ci): resolve ty panic and core type diagnostics"
    );
    ci_run = CI(name="lint+ty+tests", passed=True);
    apk_build = Build(artifact="app-release.aab", version_code=42);
    play = PlayRelease(track="internal", known_version_codes=[41, 42]);

    root +>:Triggers:+> fix_commit;
    fix_commit +>:Produces:+> ci_run;
    ci_run +>:Produces:+> apk_build;
    apk_build +>:Targets:+> play;

    tracer = PipelineTrace(conflict_version=42);
    root spawn tracer;
}
```

---

### Sample 2 (426 tokens)

- **Meta:** `source`=agent, `format`=jac, `class`=osp, `task_type`=osp, `fp`=osp_B_36__mm3_v77

#### User

Health-inspect a restaurant kitchen line (grill, fryer, cold prep): check each station's temperature, flagging anything above 40 C as a violation, and separately log every station visit. Both checks must run at every station.

#### Assistant

```jac
"""Health-inspect a restaurant kitchen line.

Two inspectors sweep every station: one flags stations whose temperature
exceeds 40 C, the other logs every station visit. Both must run at every
station, so each walker exposes a single union ability that fires once
per station node and chains into the next via a typed edge.
"""

node Station {
    has name: str = "";
    has celsius: float = 0.0;
}

edge NextStation { has label: str = ""; }

walker TempInspector {
    can start with Root entry {
        visit [-->];
    }

    can sweep with Station entry {
        flag = "VIOLATION" if here.celsius > 40.0 else "OK";
        print(f"[{flag}] {here.name} at {here.celsius} C");
        visit [-->] else { disengage; }
    }
}

walker VisitLogger {
    can start with Root entry {
        visit [-->];
    }

    can log with Station entry {
        print(f"  log: visited {here.name}");
        visit [-->] else { disengage; }
    }
}

with entry {
    grill = Station(name="Grill", celsius=180.0);
    fryer = Station(name="Fryer", celsius=22.0);
    cold = Station(name="Cold Prep", celsius=5.0);
    root ++> grill ++> fryer ++> cold;

    print("== Temperature inspection ==");
    root spawn TempInspector();
    print("== Visit log ==");
    root spawn VisitLogger();
}
```

---


## `qa/opus-synth-v2`

4,292 rows · avg 367.0 tok · total 1,575,087 tok

### Sample 1 (67 tokens)

- **Meta:** `source`=agent, `format`=jac, `task_type`=qa, `fp`=b37b97b4e3b5__doc_example_reading__0, `category`=explanation, `subtype`=doc_example_reading

#### User

When the "calculation no message" test fails, what information is missing from the failure?

#### Assistant

Any explanatory message: because `assert calculate(input) == expected;` has no message argument, the failure doesn't show what value was expected or what calculate actually returned -- which is why the excerpt labels this "Avoid - unclear failures".

---

### Sample 2 (42 tokens)

- **Meta:** `source`=agent, `format`=jac, `task_type`=qa, `fp`=dad4c810fd86__concept_recall__0, `category`=explanation, `subtype`=concept_recall

#### User

What three numeric augmented assignments does the excerpt demonstrate?

#### Assistant

count += 1 (add and assign), total *= tax_rate (multiply and assign), and value **= 2 (exponentiate and assign).

---

## `scaffold2impl/Rui-jacapp-scaffold`

105 rows · avg 1,957.3 tok · total 205,516 tok

### Sample 1 (6,219 tokens)

- **Meta:** `source`=code, `format`=repo, `class`=function, `task_type`=scaffold2impl, `fp`=ClaudeLogViewer::logs/store.jac

#### System

You are an expert jac language assistant. Provide syntatically correct Jac code inside ```jac code blocks when applicable.

#### User

Turn this Jac scaffold into a runnable file by writing every missing body. Return only ```jac ... ```.

```jac
import os;
import glob;
import json;
import from datetime { datetime }

# ---------------------------------------------------------------------------
# Wire types (see DESIGN.md - Data model)
# ---------------------------------------------------------------------------

obj ProjectSummary {
    has dir_name: str;
    has decoded_path: str;
    has session_count: int;
    has last_activity: str;
}

obj SessionSummary {
    has session_id: str;
    has file_path: str;
    has ai_title: str | None = None;
    has first_user_message: str | None = None;
    has message_count: int = 0;
    has tool_call_count: int = 0;
    has last_timestamp: str = "";
    has git_branch: str | None = None;
    has size_bytes: int = 0;
}

obj TrajectoryNode {
    has id: str;
    has record_uuid: str;
    has parent_id: str | None = None;
    has kind: str = "system_event";
    has timestamp: str = "";
    has is_sidechain: bool = False;
    has agent_id: str | None = None;
    has tool_use_id: str | None = None;
    has tool_name: str | None = None;
    has summary: str = "";
    has raw_json: str = "";
    has children: list[TrajectoryNode] = [];
}

obj SubagentRef {
    has agent_id: str;
    has file_path: str;
    has agent_type: str = "";
    has description: str = "";
    has spawn_depth: int = 1;
    has spawn_node_id: str = "";
}

obj SessionStats {
    has message_count: int = 0;
    has tool_call_count: int = 0;
    has duration_ms: int = 0;
    has git_branch: str | None = None;
}

obj ParsedSession {
    has session_id: str;
    has project_path: str;
    has main_trajectory: TrajectoryNode;
    has stats: SessionStats;
    has ai_title: str | None = None;
    has subagents: list[SubagentRef] = [];
}

# ---------------------------------------------------------------------------
# Path helpers
# ---------------------------------------------------------------------------

def _decode_project_path(dir_name: str) -> str { ... }

def _claude_root_valid(claude_root: str) -> bool { ... }

# ---------------------------------------------------------------------------
# Project / session listing (lightweight - no full trajectory parse)
# ---------------------------------------------------------------------------

def:pub list_projects(claude_root: str) -> list[ProjectSummary] { ... }

def:pub list_sessions(project_dir: str) -> list[SessionSummary] { ... }

def _extract_first_text(blocks: list) -> str | None { ... }

def _summarize_session(file_path: str) -> SessionSummary { ... }

# ---------------------------------------------------------------------------
# Full trajectory parse (see DESIGN.md S1.3 linking rules)
# ---------------------------------------------------------------------------

def _classify_block(role: str, block_type: str, tool_name: str | None) -> str { ... }

def _block_summary(kind: str, block: dict) -> str { ... }

obj _NodeDraft {
    has id: str;
    has record_uuid: str;
    has parent_id: str | None = None;
    has kind: str = "system_event";
    has timestamp: str = "";
    has is_sidechain: bool = False;
    has agent_id: str | None = None;
    has tool_use_id: str | None = None;
    has tool_name: str | None = None;
    has summary: str = "";
    has raw_json: str = "";
}

def _parse_records(file_path: str) -> list[dict] { ... }

def:pub get_session(session_file_path: str) -> ParsedSession { ... }

def _find_subagent_refs(session_file_path: str, tool_use_node_by_tool_id: dict[str, str]) -> list[SubagentRef] { ... }
```

#### Assistant

```jac
import os;
import glob;
import json;
import from datetime { datetime }

# ---------------------------------------------------------------------------
# Wire types (see DESIGN.md - Data model)
# ---------------------------------------------------------------------------

obj ProjectSummary {
    has dir_name: str;
    has decoded_path: str;
    has session_count: int;
    has last_activity: str;
}

obj SessionSummary {
    has session_id: str;
    has file_path: str;
    has ai_title: str | None = None;
    has first_user_message: str | None = None;
    has message_count: int = 0;
    has tool_call_count: int = 0;
    has last_timestamp: str = "";
    has git_branch: str | None = None;
    has size_bytes: int = 0;
}

obj TrajectoryNode {
    has id: str;
    has record_uuid: str;
    has parent_id: str | None = None;
    has kind: str = "system_event";
    has timestamp: str = "";
    has is_sidechain: bool = False;
    has agent_id: str | None = None;
    has tool_use_id: str | None = None;
    has tool_name: str | None = None;
    has summary: str = "";
    has raw_json: str = "";
    has children: list[TrajectoryNode] = [];
}

obj SubagentRef {
    has agent_id: str;
    has file_path: str;
    has agent_type: str = "";
    has description: str = "";
    has spawn_depth: int = 1;
    has spawn_node_id: str = "";
}

obj SessionStats {
    has message_count: int = 0;
    has tool_call_count: int = 0;
    has duration_ms: int = 0;
    has git_branch: str | None = None;
}

obj ParsedSession {
    has session_id: str;
    has project_path: str;
    has main_trajectory: TrajectoryNode;
    has stats: SessionStats;
    has ai_title: str | None = None;
    has subagents: list[SubagentRef] = [];
}

# ---------------------------------------------------------------------------
# Path helpers
# ---------------------------------------------------------------------------

def _decode_project_path(dir_name: str) -> str {
    return dir_name.replace("-", "/");
}

def _claude_root_valid(claude_root: str) -> bool {
    return os.path.isdir(os.path.join(claude_root, "projects"));
}

# ---------------------------------------------------------------------------
# Project / session listing (lightweight - no full trajectory parse)
# ---------------------------------------------------------------------------

def:pub list_projects(claude_root: str) -> list[ProjectSummary] {
    projects_dir = os.path.join(claude_root, "projects");
    if not os.path.isdir(projects_dir) {
        return [];
    }

    results: list[ProjectSummary] = [];
    for dir_name in sorted(os.listdir(projects_dir)) {
        full_dir = os.path.join(projects_dir, dir_name);
        if not os.path.isdir(full_dir) {
            continue;
        }
        session_files = glob.glob(os.path.join(full_dir, "*.jsonl"));
        if len(session_files) == 0 {
            continue;
        }
        mtimes: list[float] = [os.path.getmtime(f) for f in session_files];
        last_mtime: float = max(mtimes) if len(mtimes) > 0 else 0.0;
        last_activity = datetime.fromtimestamp(last_mtime).isoformat() if last_mtime > 0.0 else "";
        results.append(ProjectSummary(
            dir_name=dir_name,
            decoded_path=_decode_project_path(dir_name),
            session_count=len(session_files),
            last_activity=last_activity,
        ));
    }

    results.sort(key=lambda (p: ProjectSummary) { p.last_activity }, reverse=True);
    return results;
}

def:pub list_sessions(project_dir: str) -> list[SessionSummary] {
    if not os.path.isdir(project_dir) {
        return [];
    }
    results: list[SessionSummary] = [];
    for file_path in sorted(glob.glob(os.path.join(project_dir, "*.jsonl"))) {
        results.append(_summarize_session(file_path));
    }
    results.sort(key=lambda (s: SessionSummary) { s.last_timestamp }, reverse=True);
    return results;
}

def _extract_first_text(blocks: list) -> str | None {
    for block in blocks {
        if isinstance(block, dict) and block.get("type") == "text" {
            text = block.get("text");
            if isinstance(text, str) and len(text) > 0 {
                return text;
            }
        }
    }
    return None;
}

def _summarize_session(file_path: str) -> SessionSummary {
    session_id = os.path.splitext(os.path.basename(file_path))[0];
    ai_title: str | None = None;
    first_user_message: str | None = None;
    message_count = 0;
    tool_call_count = 0;
    last_timestamp = "";
    git_branch: str | None = None;

    with open(file_path, "r") as fh {
        for raw_line in fh {
            line = raw_line.strip();
            if len(line) == 0 {
                continue;
            }
            try {
                record: dict = json.loads(line) as dict;
            } except Exception {
                continue;
            }

            rtype = record.get("type");
            ts = record.get("timestamp");
            if isinstance(ts, str) and len(ts) > 0 {
                last_timestamp = ts;
            }
            if git_branch is None {
                gb = record.get("gitBranch");
                if isinstance(gb, str) and len(gb) > 0 {
                    git_branch = gb;
                }
            }

            if rtype == "ai-title" {
                title = record.get("aiTitle");
                if isinstance(title, str) {
                    ai_title = title;
                }
            } elif rtype == "user" or rtype == "assistant" {
                message_count += 1;
                message = record.get("message");
                content = message.get("content") if isinstance(message, dict) else None;
                if isinstance(content, list) {
                    for block in content {
                        if isinstance(block, dict) and block.get("type") == "tool_use" {
                            tool_call_count += 1;
                        }
                    }
                    if first_user_message is None and rtype == "user" {
                        text = _extract_first_text(content);
                        if text is not None {
                            first_user_message = text[:200];
                        }
                    }
                } elif isinstance(content, str) {
                    if first_user_message is None and rtype == "user" and len(content) > 0 {
                        first_user_message = content[:200];
                    }
                }
            }
        }
    }

    return SessionSummary(
        session_id=session_id,
        file_path=file_path,
        ai_title=ai_title,
        first_user_message=first_user_message,
        message_count=message_count,
        tool_call_count=tool_call_count,
        last_timestamp=last_timestamp,
        git_branch=git_branch,
        size_bytes=os.path.getsize(file_path),
    );
}

# ---------------------------------------------------------------------------
# Full trajectory parse (see DESIGN.md S1.3 linking rules)
# ---------------------------------------------------------------------------

def _classify_block(role: str, block_type: str, tool_name: str | None) -> str {
    if block_type == "text" {
        return "user_message" if role == "user" else "assistant_text";
    } elif block_type == "thinking" {
        return "thinking";
    } elif block_type == "tool_use" {
        if tool_name == "Agent" or tool_name == "Task" {
            return "subagent_spawn";
        }
        return "tool_use";
    } elif block_type == "tool_result" {
        return "tool_result";
    }
    return "system_event";
}

def _block_summary(kind: str, block: dict) -> str {
    if kind == "user_message" or kind == "assistant_text" {
        text = block.get("text");
        return (text as str)[:120] if isinstance(text, str) else "";
    }
    if kind == "thinking" {
        text = block.get("thinking");
        return (text as str)[:120] if isinstance(text, str) else "";
    }
    if kind == "tool_use" or kind == "subagent_spawn" {
        name = block.get("name");
        return name as str if isinstance(name, str) else "tool_use";
    }
    if kind == "tool_result" {
        content = block.get("content");
        if isinstance(content, str) {
            return content[:120];
        }
        return "tool_result";
    }
    return kind;
}

obj _NodeDraft {
    has id: str;
    has record_uuid: str;
    has parent_id: str | None = None;
    has kind: str = "system_event";
    has timestamp: str = "";
    has is_sidechain: bool = False;
    has agent_id: str | None = None;
    has tool_use_id: str | None = None;
    has tool_name: str | None = None;
    has summary: str = "";
    has raw_json: str = "";
}

def _parse_records(file_path: str) -> list[dict] {
    records: list[dict] = [];
    with open(file_path, "r") as fh {
        for raw_line in fh {
            line = raw_line.strip();
            if len(line) == 0 {
                continue;
            }
            try {
                records.append(json.loads(line) as dict);
            } except Exception {
                continue;
            }
        }
    }
    return records;
}

def:pub get_session(session_file_path: str) -> ParsedSession {
    records = _parse_records(session_file_path);

    drafts: dict[str, _NodeDraft] = {};
    order: list[str] = [];
    redirect: dict[str, str] = {};
    tool_use_node_by_tool_id: dict[str, str] = {};
    subagent_nodes: list[str] = [];

    last_node_id: str | None = None;
    ai_title: str | None = None;
    git_branch: str | None = None;
    message_count = 0;
    tool_call_count = 0;
    duration_ms = 0;

    idx = 0;
    for record in records {
        idx += 1;
        rtype = record.get("type");
        rec_uuid = record.get("uuid");
        uuid = rec_uuid if isinstance(rec_uuid, str) and len(rec_uuid) > 0 else f"synthetic-{idx}";
        parent_uuid = record.get("parentUuid");
        parent_uuid = parent_uuid if isinstance(parent_uuid, str) else None;
        is_sidechain = bool(record.get("isSidechain", False));
        ts = record.get("timestamp");
        ts = ts if isinstance(ts, str) else "";

        gb = record.get("gitBranch");
        if git_branch is None and isinstance(gb, str) and len(gb) > 0 {
            git_branch = gb;
        }
        if rtype == "ai-title" {
            title = record.get("aiTitle");
            if isinstance(title, str) {
                ai_title = title;
            }
        }
        if rtype == "system" and record.get("subtype") == "turn_duration" {
            d = record.get("durationMs");
            if isinstance(d, int) {
                duration_ms += d;
            }
        }

        if rtype == "user" or rtype == "assistant" {
            message_count += 1;
            message = record.get("message");
            content = message.get("content") if isinstance(message, dict) else None;
            role = message.get("role") if isinstance(message, dict) else rtype;
            role = role if isinstance(role, str) else (rtype as str);

            blocks: list[dict] = [];
            if isinstance(content, list) {
                for b in content {
                    if isinstance(b, dict) {
                        blocks.append(b);
                    }
                }
            } elif isinstance(content, str) {
                blocks.append({"type": "text", "text": content});
            }
            if len(blocks) == 0 {
                blocks.append({"type": "text", "text": ""});
            }

            prev_id: str | None = None;
            bi = 0;
            for block in blocks {
                # The FIRST block always keeps the bare record uuid - other
                # records' parentUuid always points at the record level, so
                # only block 0 is a valid attach point for external refs.
                block_node_id = uuid if bi == 0 else f"{uuid}#{bi}";
                block_type = block.get("type");
                block_type = block_type if isinstance(block_type, str) else "text";

                if block_type == "tool_result" {
                    tid = block.get("tool_use_id");
                    partner_tool_use_id = tid if isinstance(tid, str) else None;
                    partner_id: str | None = None;
                    if partner_tool_use_id is not None and partner_tool_use_id in tool_use_node_by_tool_id {
                        partner_id = tool_use_node_by_tool_id[partner_tool_use_id];
                    }
                    if partner_id is not None {
                        # Merge the result INTO its tool_use node instead of
                        # creating a separate node (user request: tool call +
                        # result should be one node).
                        partner = drafts[partner_id];
                        partner_call: dict = {};
                        try {
                            partner_call = json.loads(partner.raw_json) as dict;
                        } except Exception {
                            partner_call = {};
                        }
                        partner.raw_json = json.dumps({"tool_use": partner_call, "tool_result": block});

                        if partner.kind == "subagent_spawn" {
                            tur = record.get("toolUseResult");
                            if isinstance(tur, dict) {
                                aid = tur.get("agentId");
                                if isinstance(aid, str) {
                                    partner.agent_id = aid;
                                }
                            }
                        }

                        redirect[block_node_id] = partner_id;
                        bi += 1;
                        continue;
                    }
                    # No matching tool_use found - fall through and keep this
                    # as its own node so the data isn't silently dropped.
                }

                node_id = block_node_id;
                node_parent_id = parent_uuid if bi == 0 else prev_id;
                tool_name = block.get("name") if block_type == "tool_use" else None;
                tool_name = tool_name if isinstance(tool_name, str) else None;
                kind = _classify_block(role, block_type, tool_name);

                tool_use_id: str | None = None;
                if block_type == "tool_use" {
                    tid = block.get("id");
                    tool_use_id = tid if isinstance(tid, str) else None;
                } elif block_type == "tool_result" {
                    tid = block.get("tool_use_id");
                    tool_use_id = tid if isinstance(tid, str) else None;
                }

                if kind == "tool_use" or kind == "subagent_spawn" {
                    tool_call_count += 1;
                }

                draft = _NodeDraft(
                    id=node_id,
                    record_uuid=uuid,
                    parent_id=node_parent_id,
                    kind=kind,
                    timestamp=ts,
                    is_sidechain=is_sidechain,
                    tool_use_id=tool_use_id,
                    tool_name=tool_name,
                    summary=_block_summary(kind, block),
                    raw_json=json.dumps(block),
                );
                drafts[node_id] = draft;
                order.append(node_id);

                if block_type == "tool_use" and tool_use_id is not None {
                    tool_use_node_by_tool_id[tool_use_id as str] = node_id;
                }
                if kind == "subagent_spawn" {
                    subagent_nodes.append(node_id);
                }

                prev_id = node_id;
                bi += 1;
            }
            if prev_id is not None {
                last_node_id = prev_id;
            }
        } else {
            node_parent_id = parent_uuid if parent_uuid is not None else last_node_id;
            draft = _NodeDraft(
                id=uuid,
                record_uuid=uuid,
                parent_id=node_parent_id,
                kind="system_event",
                timestamp=ts,
                is_sidechain=is_sidechain,
                summary=(rtype as str) if isinstance(rtype, str) else "event",
                raw_json=json.dumps(record),
            );
            drafts[uuid] = draft;
            order.append(uuid);
            last_node_id = uuid;
        }
    }

    # Defensive fallback: a subagent_spawn whose completion only ever shows
    # up on a record linked via sourceToolAssistantUUID rather than a
    # matching tool_use_id (not observed in practice, but the schema allows
    # for it - see INVESTIGATE.md).
    for record in records {
        source_uuid = record.get("sourceToolAssistantUUID");
        if not isinstance(source_uuid, str) {
            continue;
        }
        for node_id in subagent_nodes {
            draft = drafts[node_id];
            if draft.agent_id is not None {
                continue;
            }
            if draft.record_uuid == source_uuid {
                tur = record.get("toolUseResult");
                if isinstance(tur, dict) {
                    aid = tur.get("agentId");
                    if isinstance(aid, str) {
                        draft.agent_id = aid;
                }
                }
            }
        }
    }

    def resolve(startId: str | None) -> str | None {
        current = startId;
        seen = 0;
        while current is not None and current in redirect and seen < 10 {
            current = redirect[current];
            seen += 1;
        }
        return current;
    }

    children_index: dict[str, list[str]] = {};
    roots: list[str] = [];
    for node_id in order {
        draft = drafts[node_id];
        resolved_parent = resolve(draft.parent_id);
        if resolved_parent is None or resolved_parent not in drafts {
            roots.append(node_id);
            continue;
        }
        if resolved_parent not in children_index {
            children_index[resolved_parent] = [];
        }
        children_index[resolved_parent].append(node_id);
    }

    def build(node_id: str) -> TrajectoryNode {
        draft = drafts[node_id];
        child_ids = children_index.get(node_id, []);
        return TrajectoryNode(
            id=draft.id,
            record_uuid=draft.record_uuid,
            parent_id=draft.parent_id,
            kind=draft.kind,
            timestamp=draft.timestamp,
            is_sidechain=draft.is_sidechain,
            agent_id=draft.agent_id,
            tool_use_id=draft.tool_use_id,
            tool_name=draft.tool_name,
            summary=draft.summary,
            raw_json=draft.raw_json,
            children=[build(cid) for cid in child_ids],
        );
    }

    contentRoots: list[str] = [rid for rid in roots if drafts[rid].kind != "system_event"];

    if len(roots) == 0 {
        main_trajectory = TrajectoryNode(id="empty", record_uuid="", kind="system_event", summary="empty session");
    } elif len(roots) == 1 {
        main_trajectory = build(roots[0]);
    } elif len(contentRoots) == 1 {
        # Only one root carries real conversation - the other roots are pure
        # bookkeeping records with no parent (e.g. the session's initial
        # "mode" event) and no children of their own. Skip the synthetic
        # wrapper so the graph starts directly at the real conversation.
        main_trajectory = build(contentRoots[0]);
    } else {
        main_trajectory = TrajectoryNode(
            id="virtual-root",
            record_uuid="",
            kind="system_event",
            summary="session root",
            children=[build(rid) for rid in roots],
        );
    }

    subagents = _find_subagent_refs(session_file_path, tool_use_node_by_tool_id);

    session_id = os.path.splitext(os.path.basename(session_file_path))[0];
    return ParsedSession(
        session_id=session_id,
        project_path=os.path.dirname(session_file_path),
        ai_title=ai_title,
        main_trajectory=main_trajectory,
        subagents=subagents,
        stats=SessionStats(
            message_count=message_count,
            tool_call_count=tool_call_count,
            duration_ms=duration_ms,
            git_branch=git_branch,
        ),
    );
}

def _find_subagent_refs(session_file_path: str, tool_use_node_by_tool_id: dict[str, str]) -> list[SubagentRef] {
    session_dir_name = os.path.splitext(os.path.basename(session_file_path))[0];
    subagents_dir = os.path.join(os.path.dirname(session_file_path), session_dir_name, "subagents");
    if not os.path.isdir(subagents_dir) {
        return [];
    }

    refs: list[SubagentRef] = [];
    for meta_path in sorted(glob.glob(os.path.join(subagents_dir, "agent-*.meta.json"))) {
        base = os.path.basename(meta_path);
        agent_id = base[len("agent-"):-len(".meta.json")];
        jsonl_path = os.path.join(subagents_dir, f"agent-{agent_id}.jsonl");
        if not os.path.isfile(jsonl_path) {
            continue;
        }
        try {
            with open(meta_path, "r") as fh {
                meta: dict = json.loads(fh.read()) as dict;
            }
        } except Exception {
            continue;
        }

        tool_use_id = meta.get("toolUseId");
        spawn_node_id = "";
        if isinstance(tool_use_id, str) and tool_use_id in tool_use_node_by_tool_id {
            spawn_node_id = tool_use_node_by_tool_id[tool_use_id];
        }

        agent_type = meta.get("agentType");
        description = meta.get("description");
        spawn_depth = meta.get("spawnDepth");

        refs.append(SubagentRef(
            agent_id=agent_id,
            file_path=jsonl_path,
            agent_type=agent_type if isinstance(agent_type, str) else "",
            description=description if isinstance(description, str) else "",
            spawn_depth=spawn_depth if isinstance(spawn_depth, int) else 1,
            spawn_node_id=spawn_node_id,
        ));
    }
    return refs;
}
```

---

### Sample 2 (1,437 tokens)

- **Meta:** `source`=code, `format`=repo, `class`=fullstack, `task_type`=scaffold2impl, `fp`=this_is_jac::components/LittleXSection.jac

#### System

You are an expert jac language assistant. Provide syntatically correct Jac code inside ```jac code blocks when applicable.

#### User

Below is a Jac file skeleton. Replace each `{ ... }` placeholder with a working implementation consistent with the declarations and docstrings. Output a single ```jac ... ``` block.

```jac
"""'A whole app, one component' - the entire littleX social app embedded as a
single `<LittleX/>`. This is the real littleX from `littlex/` (auth, feed,
follows, channels, profiles); its `sv import` walkers register in this very
server, so it reads and writes the SAME persistent graph as the rest of the
showcase. littleX scales to its container (its `min-h-screen` was changed to
`h-full`), so it fills this responsive 'app window' frame; the full standalone
app is one click away at `/littlex`."""

import from "lucide-react" { AppWindow, ArrowUpRight }
import from "@jac/runtime" { Link }
import from .SectionShell { SectionShell }
import from .CodeBlock { CodeBlock }
import from .DocsView { DocsView }
import from ..littlex.frontend { app as LittleX }

def:pub LittleXSection -> JsxElement { ... }
```

#### Assistant

```jac
"""'A whole app, one component' - the entire littleX social app embedded as a
single `<LittleX/>`. This is the real littleX from `littlex/` (auth, feed,
follows, channels, profiles); its `sv import` walkers register in this very
server, so it reads and writes the SAME persistent graph as the rest of the
showcase. littleX scales to its container (its `min-h-screen` was changed to
`h-full`), so it fills this responsive 'app window' frame; the full standalone
app is one click away at `/littlex`."""

import from "lucide-react" { AppWindow, ArrowUpRight }
import from "@jac/runtime" { Link }
import from .SectionShell { SectionShell }
import from .CodeBlock { CodeBlock }
import from .DocsView { DocsView }
import from ..littlex.frontend { app as LittleX }

def:pub LittleXSection -> JsxElement {
    app_code = (
        """# app.jac - the data, the endpoint, and the UI in one file.

# this is a class
node Tweet {
    has content: str,
        author: str,
        likes: int = 0;
}

# Back end: compiles to a public endpoint - this IS the API.
def:pub create_tweet(content: str) -> Tweet {
    # this might look strange, but it abstracts away auth and db
    root ++> (tweet := Tweet(content=content, author="ada"));
    return tweet;
}

# Front end: a cl def calls the endpoint like a function.
cl def Composer -> JsxElement {
    has text: str = "";

    async def post -> None {
        new_tweet = await create_tweet(text);  # typed end to end
        print(new_tweet.author, new_tweet.likes);
    }

    return <button onClick={post}>Tweet</button>;
}"""
    );

    return
        <SectionShell
            id="littlex"
            eyebrow="Real apps"
            title="Below is a Real Twitter-like App. Use It."
            subtitle="In a single component. All frontend/backend interfacing, data handling, and db organization is abstracted away (done for you and optimized by the compiler)."
        >
            <div className="mx-auto max-w-5xl">
                <div
                    className="overflow-hidden rounded-2xl border border-border bg-card shadow-2xl shadow-black/40"
                >
                    <div
                        className="flex items-center gap-2 border-b border-border/70 bg-white/[0.02] px-4 py-2.5"
                    >
                        <span className="size-3 rounded-full bg-[#ff5f57]"/>
                        <span className="size-3 rounded-full bg-[#febc2e]"/>
                        <span className="size-3 rounded-full bg-[#28c840]"/>
                        <span
                            className="ml-2 flex items-center gap-1.5 font-mono text-xs text-muted-foreground"
                        >
                            <AppWindow size={13}/>
                            littlex - embedded live app, same graph
                        </span>
                        <Link
                            to="/littlex"
                            className="ml-auto flex items-center gap-1 rounded-md px-2 py-1 text-xs text-muted-foreground transition hover:bg-white/5 hover:text-foreground"
                        >
                            open full app
                            <ArrowUpRight size={13}/>
                        </Link>
                    </div>
                    <div
                        className="h-[78vh] min-h-[600px] max-h-[860px] overflow-hidden bg-background"
                    >
                        <LittleX/>
                    </div>
                </div>
                <p className="mt-4 text-center text-sm text-muted-foreground">
                    Sign up inside the frame to try it - your account and posts persist in the shared graph. Or{" "}
                    <Link
                        to="/littlex"
                        className="font-medium text-primary hover:underline"
                    >
                        open the full app at /littlex
                    </Link>
                    .
                </p>
                <div className="mb-10">
                    <p className="mb-4 text-center text-sm text-muted-foreground">
                        The data, the endpoint, and the UI in one file: the front end calls the back end like a function and gets a typed{" "}
                        <span className="font-mono text-foreground">Tweet</span>{" "}
                        back. No fetch, no REST route, no JSON.
                    </p>
                    <div className="grid items-stretch gap-4 lg:grid-cols-2">
                        <CodeBlock filename="app.jac" code={app_code} dense={True}/>
                        <DocsView/>
                    </div>
                    <p className="mt-3 text-center text-xs text-muted-foreground">
                        That single file is already a live API: every endpoint shows up in the auto-generated Swagger UI on the right.
                    </p>
                </div>
            </div>
        </SectionShell>;
}
```

---

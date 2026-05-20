# ═══════════════════════════════════════════════════════════════════
# setup-m06-phase2.ps1
# M06 - Metacognition — Phase 1 scaffold + Section 1 (Opening)
#
# USAGE: create folder, place PS1 inside, then:
#   PS> cd C:\Users\sharo\OneDrive\מסמכים\sharon_workspace\creative-thinking
#   PS> Unblock-File .\setup-m06-phase2.ps1
#   PS> .\setup-m06-phase2.ps1
#   PS> npm install
#   PS> npm run dev
# ═══════════════════════════════════════════════════════════════════

$ErrorActionPreference = 'Stop'
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Write-Source {
    param([string]$Path, [string]$Body)
    $full = Join-Path -Path (Get-Location) -ChildPath $Path
    $dir  = Split-Path -Parent $full
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    [System.IO.File]::WriteAllText($full, $Body, $utf8NoBom)
    Write-Host "  + $Path" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "M06 Phase 2 - visual redesign - full module (8 sections)" -ForegroundColor Magenta
Write-Host ""

Write-Source -Path '.gitignore' -Body @'
node_modules
dist
dist-ssr
*.local

.vscode/*
!.vscode/extensions.json
.idea
.DS_Store
*.log
'@
Write-Source -Path 'index.html' -Body @'
<!DOCTYPE html>
<html lang="he" dir="rtl">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#F5F6F8" />

    <!-- Frank Ruhl Libre (Hebrew serif, display) + Heebo (body) + IBM Plex Mono (eyebrow tags) -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Frank+Ruhl+Libre:wght@300;400;500;700&family=Heebo:wght@300;400;500&family=IBM+Plex+Mono:wght@400;500&display=swap"
      rel="stylesheet"
    />

    <title>מטא-קוגניציה בכיתה</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
'@
Write-Source -Path 'package.json' -Body @'
{
  "name": "m06-creative-thinking",
  "private": true,
  "version": "0.1.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc -b && vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-icons": "^5.3.0",
    "react-router-dom": "^6.27.0"
  },
  "devDependencies": {
    "@types/node": "^22.7.0",
    "@types/react": "^18.3.12",
    "@types/react-dom": "^18.3.1",
    "@vitejs/plugin-react": "^4.3.3",
    "sass": "^1.80.0",
    "typescript": "^5.6.0",
    "vite": "^5.4.21"
  }
}
'@
Write-Source -Path 'public/favicon.svg' -Body @'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
  <circle cx="16" cy="16" r="14" fill="#FFFFFF" stroke="#1F4B9F" stroke-width="1.5"/>
  <circle cx="16" cy="16" r="6" fill="none" stroke="#1F4B9F" stroke-width="1.2"/>
  <circle cx="16" cy="16" r="1.8" fill="#1F4B9F"/>
</svg>
'@
Write-Source -Path 'src/App.tsx' -Body @'
import React from 'react';
import ModuleRouter from '@/router/ModuleRouter';

const App: React.FC = () => <ModuleRouter />;
export default App;
'@
Write-Source -Path 'src/components/LessonPlanCard/LessonPlanCard.module.scss' -Body @'
.card {
  @include flex-col;
  gap: $space-4;
  padding: $space-5;
  background: $bg-surface;
  border: $border-hair;
  border-radius: $radius-md;
}

// Print variant — flatter, lighter, no border
.cardPrint {
  border: none;
  padding: 0;
  background: transparent;
}

// ── HEAD ───────────────────────────────────────────────────────
.head {
  @include flex-col;
  gap: $space-2;
  padding-bottom: $space-3;
  border-bottom: $border-subtle;
}

.title {
  @include headline-subsection;
  font-weight: $weight-regular;
}

.meta {
  display: inline-flex;
  align-items: center;
  gap: $space-2;
  flex-wrap: wrap;
  font-family: $font-mono;
  font-size: 11px;
  color: $ink-soft;
  letter-spacing: 0.04em;

  span:not(.totalTime) { line-height: 1; }
}

.totalTime {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  margin-inline-start: auto;
  color: $accent;

  svg { font-size: 12px; }
}

// ── BLOCKS ─────────────────────────────────────────────────────
.blocks {
  list-style: none;
  margin: 0;
  padding: 0;
  @include flex-col;
  gap: $space-4;
}

.block {
  display: grid;
  grid-template-columns: 48px 1fr;
  gap: $space-4;
  align-items: baseline;
}

.duration {
  font-family: $font-mono;
  font-size: $text-sm;
  font-weight: $weight-medium;
  color: $accent;
  text-align: end;
  padding-top: 3px;

  &::after {
    content: '׳';
    margin-inline-start: 2px;
    color: $ink-faint;
    font-weight: $weight-regular;
  }
}

.body { @include flex-col; gap: $space-1; min-width: 0; }

.blockTitle {
  font-family: $font-body;
  font-size: $text-base;
  font-weight: $weight-medium;
  color: $ink;
  line-height: $leading-tight;
}

.blockDesc {
  @include body-paragraph;
  font-size: $text-sm;
}
'@
Write-Source -Path 'src/components/LessonPlanCard/LessonPlanCard.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// LessonPlanCard — reusable time-blocks display for a lesson plan.
// Used by Section 6 (each demo) and Section 7 (personal lesson),
// and rendered in print form by Section 8.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import { TbClock } from 'react-icons/tb';
import type { LessonBlock } from '@/data/methods';
import styles from './LessonPlanCard.module.scss';

interface Props {
  titleHe:   string;
  blocks:    LessonBlock[];
  classHe?:  string;
  topicHe?:  string;
  variant?:  'screen' | 'print';
}

const LessonPlanCard: React.FC<Props> = ({
  titleHe, blocks, classHe, topicHe, variant = 'screen',
}) => {
  const totalMin = blocks.reduce((sum, b) => sum + b.durationMin, 0);
  const isPrint = variant === 'print';

  return (
    <article className={[styles.card, isPrint && styles.cardPrint].filter(Boolean).join(' ')}>
      <header className={styles.head}>
        <h3 className={styles.title}>{titleHe}</h3>
        <div className={styles.meta}>
          {classHe && <span>{classHe}</span>}
          {topicHe && <span>· {topicHe}</span>}
          <span className={styles.totalTime}>
            <TbClock aria-hidden /> {totalMin} דק׳
          </span>
        </div>
      </header>

      <ol className={styles.blocks}>
        {blocks.map((b, i) => (
          <li key={i} className={styles.block}>
            <span className={styles.duration}>{b.durationMin}</span>
            <div className={styles.body}>
              <h4 className={styles.blockTitle}>{b.titleHe}</h4>
              <p className={styles.blockDesc}>{b.descriptionHe}</p>
            </div>
          </li>
        ))}
      </ol>
    </article>
  );
};

export default LessonPlanCard;
'@
Write-Source -Path 'src/components/ModuleShell/ModuleProgressContext.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// ModuleProgressContext — exposes useModuleProgress to all sections
// without prop drilling.
// ═══════════════════════════════════════════════════════════════════
import { createContext, useContext } from 'react';
import { useModuleProgress } from '@/hooks/useModuleProgress';

type Ctx = ReturnType<typeof useModuleProgress>;

export const ModuleProgressContext = createContext<Ctx | null>(null);

export function useProgressCtx() {
  const ctx = useContext(ModuleProgressContext);
  if (!ctx) throw new Error('useProgressCtx must be inside a ModuleProgressContext.Provider');
  return ctx;
}
'@
Write-Source -Path 'src/components/ModuleShell/ModuleShell.module.scss' -Body @'
.shell {
  min-height: 100vh;
  background: $bg-canvas;
}

.main {
  max-width: $content-base;
  margin: 0 auto;
  padding: $space-7 $space-5 $space-9;

  @include respond-to(md) {
    padding: $space-8 $space-6 $space-10;
  }
}
'@
Write-Source -Path 'src/components/ModuleShell/ModuleShell.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// ModuleShell — common wrapper around every section.
// Provides ModuleProgressContext + renders the ProgressBar + Outlet.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import { Outlet } from 'react-router-dom';
import { useModuleProgress } from '@/hooks/useModuleProgress';
import { ModuleProgressContext } from './ModuleProgressContext';
import ProgressBar from '@/components/ProgressBar/ProgressBar';
import styles from './ModuleShell.module.scss';

const ModuleShell: React.FC = () => {
  const progress = useModuleProgress();

  return (
    <ModuleProgressContext.Provider value={progress}>
      <div className={styles.shell}>
        <ProgressBar />
        <div className={styles.main}>
          <Outlet />
        </div>
      </div>
    </ModuleProgressContext.Provider>
  );
};

export default ModuleShell;
'@
Write-Source -Path 'src/components/Placeholder/Placeholder.module.scss' -Body @'
.box {
  @include flex-col;
  align-items: center;
  gap: $space-3;
  padding: $space-7 $space-5;
  background: $accent-faint;
  border-radius: $radius-md;
  text-align: center;
}

.icon {
  @include flex-center;
  width: 36px; height: 36px;
  border-radius: 50%;
  background: $accent-soft;
  color: $accent;
  font-size: 18px;
}

.text {
  font-family: $font-body;
  font-weight: $weight-light;
  font-size: $text-md;
  color: $ink-mid;
  max-width: 320px;
  line-height: $leading-loose;
}
'@
Write-Source -Path 'src/components/Placeholder/Placeholder.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// Placeholder — used by ModuleRouter for sections that haven't been
// implemented yet. Goes away in Phase 2.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import { TbBulb } from 'react-icons/tb';
import SectionShell from '@/components/SectionShell/SectionShell';
import type { SectionId } from '@/types/module.types';
import styles from './Placeholder.module.scss';

interface Props { id: SectionId; }

const Placeholder: React.FC<Props> = ({ id }) => (
  <SectionShell id={id}>
    <div className={styles.box}>
      <span className={styles.icon} aria-hidden><TbBulb /></span>
      <p className={styles.text}>החלק הזה ייבנה בשלב הבא של ההשתלמות.</p>
    </div>
  </SectionShell>
);

export default Placeholder;
'@
Write-Source -Path 'src/components/ProgressBar/ProgressBar.module.scss' -Body @'
// ───────────────────────────────────────────────────────────────
// Quiet Minimal progress bar
// A thin row of section numbers + a hairline rule beneath the
// active one. No pills, no badges, no colored chunks.
// ───────────────────────────────────────────────────────────────
.bar {
  position: sticky;
  top: 0;
  z-index: 40;
  background: rgba(245, 246, 248, 0.92);
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  border-bottom: $border-subtle;
  padding: $space-3 0;

  @media print { display: none; }
}

.steps {
  max-width: $content-wide;
  margin: 0 auto;
  padding: 0 $space-5;
  list-style: none;
  display: flex;
  align-items: center;
  gap: $space-1;
  overflow-x: auto;
  scrollbar-width: thin;
}

.stepItem { flex-shrink: 0; }

.step {
  @include focus-ring;
  display: inline-flex;
  align-items: baseline;
  gap: $space-2;
  padding: $space-2 $space-3;
  background: transparent;
  border: none;
  border-radius: $radius-sm;
  text-decoration: none;
  color: $ink-soft;
  font-family: $font-body;
  font-size: $text-sm;
  font-weight: $weight-regular;
  cursor: pointer;
  white-space: nowrap;
  transition: color $dur-fast $ease-out;

  &:hover:not(.stepLocked) {
    color: $ink;
  }
}

.stepNum {
  font-family: $font-mono;
  font-size: 11px;
  color: $ink-faint;
  letter-spacing: 0.04em;

  svg { font-size: 12px; }
}

.stepLabel { line-height: 1; }

// ── STATES ─────────────────────────────────────────────────────
.stepCurrent {
  color: $ink !important;
  font-weight: $weight-medium;
  position: relative;

  .stepNum { color: $accent; }

  &::after {
    content: '';
    position: absolute;
    inset-inline: $space-3;
    bottom: -$space-3;
    height: 1px;
    background: $accent;
  }
}

.stepCompleted:not(.stepCurrent) {
  color: $ink-mid;

  .stepNum {
    color: $success;
    svg { font-size: 12px; }
  }
}

.stepLocked {
  opacity: 0.45;
  cursor: not-allowed;
}
'@
Write-Source -Path 'src/components/ProgressBar/ProgressBar.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// ProgressBar — horizontal pill stepper showing all 8 sections.
// Sticky below the app bar. Click any visited/current step to jump.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import { NavLink, useLocation } from 'react-router-dom';
import { TbCheck } from 'react-icons/tb';
import { SECTIONS, getSectionIndex } from '@/data/sections';
import { useProgressCtx } from '@/components/ModuleShell/ModuleProgressContext';
import type { SectionId } from '@/types/module.types';
import styles from './ProgressBar.module.scss';

const ProgressBar: React.FC = () => {
  const { progress } = useProgressCtx();
  const location = useLocation();
  const currentId = (location.pathname.replace(/^\//, '') || 'opening') as SectionId;
  const currentIdx = getSectionIndex(currentId);

  return (
    <nav className={styles.bar} aria-label="התקדמות בהשתלמות">
      <ol className={styles.steps}>
        {SECTIONS.map((s, i) => {
          const state = progress.sections[s.id];
          const isCurrent = s.id === currentId;
          const isCompleted = state?.completed === true;
          const isVisited = state?.visited === true;
          const isAccessible = i <= currentIdx || isVisited;

          return (
            <li key={s.id} className={styles.stepItem}>
              <NavLink
                to={s.path}
                className={[
                  styles.step,
                  isCurrent && styles.stepCurrent,
                  isCompleted && styles.stepCompleted,
                  !isAccessible && styles.stepLocked,
                ].filter(Boolean).join(' ')}
                aria-current={isCurrent ? 'step' : undefined}
                onClick={(e) => { if (!isAccessible) e.preventDefault(); }}
              >
                <span className={styles.stepNum} aria-hidden>
                  {isCompleted ? <TbCheck /> : s.number}
                </span>
                <span className={styles.stepLabel}>{s.shortHe}</span>
              </NavLink>
            </li>
          );
        })}
      </ol>
    </nav>
  );
};

export default ProgressBar;
'@
Write-Source -Path 'src/components/PromptCard/PromptCard.module.scss' -Body @'
.card {
  @include flex-col;
  gap: $space-4;
  padding: $space-5 $space-5;
  background: $bg-surface;
  border: $border-hair;
  border-radius: $radius-md;
}

// ── HEAD ───────────────────────────────────────────────────────
.head {
  @include flex-between;
  gap: $space-3;
  padding-bottom: $space-3;
  border-bottom: $border-subtle;
}

.name {
  @include headline-subsection;
  font-weight: $weight-regular;
  flex: 1;
  min-width: 0;
}

.copy {
  @include btn-secondary;
  display: inline-flex;
  align-items: center;
  gap: $space-2;
  padding: 6px 14px;
  font-size: $text-xs;

  svg { font-size: 14px; }
}

// ── PARTS ──────────────────────────────────────────────────────
.parts {
  @include flex-col;
  gap: $space-3;
  margin: 0;
}

.part {
  display: grid;
  grid-template-columns: 80px 1fr;
  gap: $space-3;
  align-items: baseline;

  @media (max-width: $bp-sm) {
    grid-template-columns: 1fr;
    gap: $space-1;
  }

  dt {
    @include eyebrow;
    margin: 0;
    padding-top: 3px;
    color: $accent;
  }

  dd {
    margin: 0;
    @include body-paragraph;
    color: $ink;
    font-weight: $weight-regular;
  }
}

// ── EXAMPLE ────────────────────────────────────────────────────
.example {
  padding: $space-4 $space-4;
  background: $accent-faint;
  border-radius: $radius-sm;
  font-size: $text-sm;
  line-height: $leading-loose;
  color: $ink-mid;
  font-style: italic;

  p { margin: 0; }
}

.exampleLabel {
  display: block;
  @include eyebrow;
  margin-bottom: $space-1;
  color: $ink-soft;
  font-style: normal;
}
'@
Write-Source -Path 'src/components/PromptCard/PromptCard.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// PromptCard — reusable 4-part prompt display.
// Used by Section 5 (Card 1), Section 6 (each method demo),
// Section 7 (personal lesson), Section 8 (printable deck).
// ═══════════════════════════════════════════════════════════════════
import React, { useState } from 'react';
import { TbCopy, TbCheck } from 'react-icons/tb';
import type { FourPartPrompt } from '@/data/methods';
import styles from './PromptCard.module.scss';

interface Props {
  prompt:     FourPartPrompt;
  nameHe?:    string;
  exampleHe?: string;
}

function joinPrompt(p: FourPartPrompt): string {
  return [
    'תפקיד:',  p.roleHe,        '',
    'הקשר:',   p.contextHe,     '',
    'משימה:',  p.taskHe,        '',
    'מגבלות:', p.constraintsHe,
  ].join('\n');
}

const PromptCard: React.FC<Props> = ({ prompt, nameHe, exampleHe }) => {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(joinPrompt(prompt));
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch { /* no clipboard, ignore */ }
  };

  return (
    <article className={styles.card}>
      <header className={styles.head}>
        {nameHe && <h3 className={styles.name}>{nameHe}</h3>}
        <button
          type="button"
          className={styles.copy}
          onClick={handleCopy}
          aria-label="העתק את הפרומפט"
        >
          {copied ? (<><TbCheck aria-hidden /><span>הועתק</span></>)
                  : (<><TbCopy  aria-hidden /><span>העתק</span></>)}
        </button>
      </header>

      <dl className={styles.parts}>
        <div className={styles.part}>
          <dt>תפקיד</dt>
          <dd>{prompt.roleHe}</dd>
        </div>
        <div className={styles.part}>
          <dt>הקשר</dt>
          <dd>{prompt.contextHe}</dd>
        </div>
        <div className={styles.part}>
          <dt>משימה</dt>
          <dd>{prompt.taskHe}</dd>
        </div>
        <div className={styles.part}>
          <dt>מגבלות</dt>
          <dd>{prompt.constraintsHe}</dd>
        </div>
      </dl>

      {exampleHe && (
        <div className={styles.example}>
          <span className={styles.exampleLabel}>דוגמה ממולאת:</span>
          <p>{exampleHe}</p>
        </div>
      )}
    </article>
  );
};

export default PromptCard;
'@
Write-Source -Path 'src/components/SectionShell/SectionShell.module.scss' -Body @'
// ───────────────────────────────────────────────────────────────
// SectionShell — editorial column.
// Section opens with a meta line + light-weight headline + lede.
// Body flows below in the same narrow column. Bottom: prev/next.
// ───────────────────────────────────────────────────────────────
.section {
  @include column-base;
  @include flex-col;
  gap: $space-7;
}

// ── HEAD ───────────────────────────────────────────────────────
.head {
  @include flex-col;
  gap: $space-3;
  padding-bottom: $space-5;
  border-bottom: $border-subtle;
}

.num {
  @include section-number;
}

.title {
  @include headline-hero;
}

.subtitle {
  @include lede;
  margin-top: $space-1;
  max-width: $content-narrow;
}

// ── BODY ───────────────────────────────────────────────────────
.body {
  @include flex-col;
  gap: $space-7;
}

// ── NAV ────────────────────────────────────────────────────────
.nav {
  @include flex-between;
  gap: $space-3;
  padding-top: $space-6;
  margin-top: $space-5;
  border-top: $border-subtle;

  @media print { display: none; }
}

.navSpacer { flex: 1; }

.btnPrev {
  @include btn-secondary;
  @include flex-start;
  gap: $space-2;

  svg { font-size: 16px; }
}

.btnNext {
  @include btn-primary;
  @include flex-start;
  gap: $space-2;

  svg { font-size: 16px; }

  &:disabled { background: $line-strong; border-color: $line-strong; }
}
'@
Write-Source -Path 'src/components/SectionShell/SectionShell.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// SectionShell — wraps every section. Renders:
//   - Title block (number, title, subtitle)
//   - Children
//   - Prev/Next nav
// Optional `canAdvance` prop gates the next button (e.g. break form).
// On mount, marks section as visited.
// ═══════════════════════════════════════════════════════════════════
import React, { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { TbArrowRight, TbArrowLeft } from 'react-icons/tb';
import { SECTION_BY_ID, getNextSection, getPrevSection } from '@/data/sections';
import { useProgressCtx } from '@/components/ModuleShell/ModuleProgressContext';
import type { SectionId } from '@/types/module.types';
import styles from './SectionShell.module.scss';

interface Props {
  id: SectionId;
  children: React.ReactNode;
  canAdvance?: boolean;
}

const SectionShell: React.FC<Props> = ({ id, children, canAdvance = true }) => {
  const navigate = useNavigate();
  const { visit, complete } = useProgressCtx();
  const section = SECTION_BY_ID[id];
  const next = getNextSection(id);
  const prev = getPrevSection(id);

  useEffect(() => { visit(id); }, [id, visit]);

  const goNext = () => {
    if (!canAdvance) return;
    complete(id);
    if (next) navigate(next.path);
  };

  const goPrev = () => {
    if (prev) navigate(prev.path);
  };

  return (
    <article className={styles.section}>
      {/* TITLE BLOCK */}
      <header className={styles.head}>
        <span className={styles.num}>{section.number} / 8</span>
        <h1 className={styles.title}>{section.titleHe}</h1>
        <p className={styles.subtitle}>{section.subtitleHe}</p>
      </header>

      {/* CONTENT */}
      <div className={styles.body}>{children}</div>

      {/* NAV */}
      <nav className={styles.nav} aria-label="ניווט בין חלקים">
        {prev && (
          <button type="button" className={styles.btnPrev} onClick={goPrev}>
            <TbArrowRight aria-hidden />
            <span>{prev.shortHe}</span>
          </button>
        )}
        <div className={styles.navSpacer} />
        {next && (
          <button
            type="button"
            className={styles.btnNext}
            onClick={goNext}
            disabled={!canAdvance}
            title={!canAdvance ? 'יש להשלים את הפעולה הנדרשת בחלק הזה לפני המעבר הלאה' : undefined}
          >
            <span>{next.shortHe}</span>
            <TbArrowLeft aria-hidden />
          </button>
        )}
      </nav>
    </article>
  );
};

export default SectionShell;
'@
Write-Source -Path 'src/data/methods.ts' -Body @'
// ═══════════════════════════════════════════════════════════════════
// M06 · Method demos
// KWL · Think-aloud · Exit tickets. Each on a real classroom situation.
// ═══════════════════════════════════════════════════════════════════
import type { TechniqueKey } from '@/types/module.types';

export interface FourPartPrompt {
  roleHe:        string;
  contextHe:     string;
  taskHe:        string;
  constraintsHe: string;
}

export interface OutputRow {
  labelHe: string;
  valueHe: string;
}

export interface LessonBlock {
  durationMin:    number;
  titleHe:        string;
  descriptionHe:  string;
}

export interface MethodDemo {
  id:             TechniqueKey;
  nameHe:         string;
  taglineHe:      string;
  whenToUseHe:    string;
  challengeHe:    string;
  gradeHe:        string;
  subjectHe:      string;
  prompt:         FourPartPrompt;
  outputs:        OutputRow[];
  lesson:         LessonBlock[];
  reflectionHe:   string;
}

// ── KWL ────────────────────────────────────────────────────────
export const KWL_DEMO: MethodDemo = {
  id: 'kwl',
  nameHe: 'KWL · מה אני יודע, מה אני רוצה לדעת, מה למדתי',
  taglineHe: 'מטא-קוגניציה לפני הלמידה — לא אחריה',
  whenToUseHe: 'בפתיחת יחידה. כשרוצים לגלות מה התלמידים חושבים שהם יודעים (כולל מה שגוי) לפני שמלמדים.',
  challengeHe: 'מתחילה יחידה על דמוקרטיה בכיתה ח׳. אני יודעת מהניסיון שהילדים יבואו עם דעות, אבל אני לא תמיד יודעת איפה הם עומדים בדיוק. רוצה לפתוח עם KWL שיוציא מהם את התפיסות המוקדמות — בלי שיפוט, ועם 5 תפיסות שגויות שאני יכולה לחפש.',
  gradeHe: 'כיתה ח׳',
  subjectHe: 'אזרחות',
  prompt: {
    roleHe: 'את מומחית במטא-קוגניציה ובהוראת אזרחות. את יודעת ש-KWL פותח חלון לתפיסות המוקדמות של תלמידים.',
    contextHe: 'אני מתחילה יחידה על "דמוקרטיה" בכיתה ח׳. שיעור פתיחה — 45 דקות. רוצה לפתוח עם KWL שמוציא תפיסות מוקדמות.',
    taskHe: 'בני לי טופס KWL מותאם. ב-K: 5 שאלות מובילות שמוציאות ידע מוקדם. ב-W: 5 שאלות מעוררות סקרנות. ב-L: 3 שאלות סיכום ליחידה. **הוסיפי 5 תפיסות שגויות נפוצות שצפויות לעלות ב-K** — כדי שאדע מה לחפש.',
    constraintsHe: 'בעברית, רמה לכיתה ח׳. עמוד אחד. רק שאלות, לא תשובות.',
  },
  outputs: [
    { labelHe: 'K · ידע מוקדם · ש1', valueHe: 'איפה במציאות אתם הכי "מרגישים" שאתם חיים בדמוקרטיה? (כתבו רגע ספציפי)' },
    { labelHe: 'K · ש2',              valueHe: 'מי קובע באמת מה קורה במדינה? נמקו.' },
    { labelHe: 'K · ש3',              valueHe: 'מה ההבדל, לדעתכם, בין "רוב מחליט" לבין "דמוקרטיה"?' },
    { labelHe: 'W · סקרנות · ש1',     valueHe: 'מה הייתם רוצים לשנות במערכת — אבל אתם לא בטוחים אם אפשר?' },
    { labelHe: 'W · ש2',              valueHe: 'איך אנשים יודעים אם מנהיג שלהם הוא דמוקרטי או לא?' },
    { labelHe: 'L · סיכום · ש1',      valueHe: 'דבר אחד שחשבתם שאתם יודעים — והתברר שיש לו צד שני.' },
    { labelHe: 'תפיסה שגויה · 1',     valueHe: '"דמוקרטיה = רוב מחליט." → התלמידים לא רואים את ההגנה על המיעוט. נדבקת כי בכיתה הצבעות מוכרעות ברוב.' },
    { labelHe: 'תפיסה שגויה · 2',     valueHe: '"בחירות = דמוקרטיה." → גם משטרים סמכותניים מקיימים בחירות. נדבקת כי זה הסמל החזותי.' },
    { labelHe: 'תפיסה שגויה · 3',     valueHe: '"הפרדת רשויות זה רק חוקתי." → התלמידים לא רואים את הקשר היומיומי שלהם לזה.' },
    { labelHe: 'תפיסה שגויה · 4',     valueHe: '"חופש ביטוי = לומר כל דבר." → מבלבלים בין זכות לבין עידוד. נדבקת מתרבות הרשתות.' },
    { labelHe: 'תפיסה שגויה · 5',     valueHe: '"אם מותר זה דמוקרטי." → התלמידים לא מבחינים בין מה שמותר בחוק לבין מה שנכון מוסרית.' },
  ],
  lesson: [
    { durationMin: 5,  titleHe: 'כתיבה אישית · עמודת K',        descriptionHe: 'כל תלמיד ממלא בשקט את עמודת ה-K. בלי לדבר. בלי לחפש. רק מה שיש בראש כרגע.' },
    { durationMin: 10, titleHe: 'שיחת חברותא',                    descriptionHe: 'בזוגות, מציגים זה לזו את ה-K שלהם. שואלים שאלה אחת על מה שכתב/ה השני/ה.' },
    { durationMin: 10, titleHe: 'מיפוי על הלוח',                  descriptionHe: 'כל זוג מביא תשובה אחת מהזוג. אני כותבת על הלוח. לא מתקנת. רק ממפה.' },
    { durationMin: 10, titleHe: 'מציגה את 5 התפיסות',             descriptionHe: 'בלי לזהות מי אמר מה. שואלת: "איזו תפיסה אצלכם זהה? איזו שונה?" — זה הזרע ליחידה.' },
    { durationMin: 10, titleHe: 'משאלת לימוד · עמודת W',          descriptionHe: 'כתבו שאלה אחת שבא לכם להבין עד סוף היחידה. אספור. נחזור אליהן בכל שיעור.' },
  ],
  reflectionHe: 'הפעם הראשונה שעשיתי KWL גיליתי ש-7 מ-32 תלמידים האמינו ש"דמוקרטיה = רוב מחליט", בלי שום הסתייגות. זאת הייתה היחידה הכי טובה שלימדתי. כי הם רצו דעת — לא קיבלו שיעור, הם פתרו שאלה שהם עצמם שאלו.',
};

// ── THINK-ALOUD ────────────────────────────────────────────────
export const THINKALOUD_DEMO: MethodDemo = {
  id: 'thinkaloud',
  nameHe: 'חשיבה רועשת · Think-Aloud',
  taglineHe: 'להדגים את התהליך, לא רק את התשובה',
  whenToUseHe: 'כשתלמידים יודעים את התשובה אבל לא איך מגיעים אליה. כשסוג שלם של בעיות חוסם אותם.',
  challengeHe: 'כיתה ה׳ נתקעת בבעיות מילוליות עם שברים. הם יודעים לחשב 3/8+3/8 בנפרד. אבל הבעיה "שני חברים אכלו 3/8 פיצה כל אחד, כמה נשאר?" — קופאת אותם. הבעיה היא לא חשבונית. היא הבנת השלבים: מה השאלה? מה ידוע? מה אני עושה קודם?',
  gradeHe: 'כיתה ה׳',
  subjectHe: 'מתמטיקה',
  prompt: {
    roleHe: 'את מורה מומחית למתמטיקה לכיתה ה׳, שמדגימה לתלמידים את הדיאלוג הפנימי של פותר בעיות מנוסה.',
    contextHe: 'הבעיה: "פיצה חולקה ל-8 פרוסות. שני חברים אכלו כל אחד 3/8. כמה נשאר?" התלמידים נופלים על "מה לעשות קודם".',
    taskHe: 'כתבי תסריט "חשיבה רועשת" מלא לפתרון — בגוף ראשון. כללי: (1) כל מחשבה, גם אם נראית מובנת מאליה. (2) רגעי-עצירה ("רגע, האם זה באמת מה ש..."). (3) הערכה ("האם זה הגיוני? אם פיצה אחת מספיקה לשניים, אז..."). (4) רגע של "כמעט טעיתי". בסוף — 4 צעדי-חשיבה שאני יכולה ללמד את התלמידים להחיל בעצמם.',
    constraintsHe: 'בעברית. 250-400 מילים בתסריט. אל תפשטי — תני את החשיבה כפי שהיא באמת, עם הפסקות והיסוסים.',
  },
  outputs: [
    { labelHe: 'תסריט · פתיחה',          valueHe: '"OK, מה נדרש פה? אני קוראת שוב. שני חברים אכלו 3/8 כל אחד. רגע, לא אמרת הוא אכל 3/8 ואז ה־8 — אכלו ביחד? בואו אסמן את החלקים שיש לי בעובדות..."' },
    { labelHe: 'תסריט · עצירה',          valueHe: '"רגע. אני רוצה להחליט מה אני שואלת. השאלה היא ׳כמה נשאר׳ — לא ׳כמה אכלו׳. אז התשובה היא ׳מה שלא נאכל׳. אכן... אני צריכה למצוא קודם את מה שכן."' },
    { labelHe: 'תסריט · הערכה',          valueHe: '"בואו אעצור. אם כל אחד אכל 3/8, ושניים אכלו, אז יחד 6/8. האם זה הגיוני? יותר מחצי פיצה — כן, שני חברים בדרך כלל אוכלים יותר מחצי. סבבה."' },
    { labelHe: 'תסריט · "כמעט טעיתי"',   valueHe: '"כמעט כתבתי שנשאר 5/8. אבל זה לא. נשאר 8/8 פחות 6/8. שווה ל-2/8. שזה רבע. כן. רבע פיצה."' },
    { labelHe: 'צעד-חשיבה · 1',          valueHe: '**קרא שוב.** עצור. שאל: מה השאלה האמיתית? לפעמים השאלה לא "כמה אכלו" אלא "כמה נשאר".' },
    { labelHe: 'צעד-חשיבה · 2',          valueHe: '**צייר/סמן.** מה ידוע? מה לא ידוע? מה אני מחפש? (בעיות שברים: ציור פיצה עוזר.)' },
    { labelHe: 'צעד-חשיבה · 3',          valueHe: '**הערך לפני שתחשב.** האם זה הגיוני? יותר/פחות מחצי? יותר/פחות מהשלם?' },
    { labelHe: 'צעד-חשיבה · 4',          valueHe: '**בדוק בסוף.** האם מצאת מה ששאלו? קרא שוב את השאלה.' },
  ],
  lesson: [
    { durationMin: 8,  titleHe: 'הדגמה חיה · המורה חושב רועש',  descriptionHe: 'הצגתי בעיה חדשה על הלוח. דיברתי דרכה בקול — כל הספקות, כל החזרות. הילדים שמעו "מורה תוהה" — לא "מורה יודעת".' },
    { durationMin: 12, titleHe: 'חשיבה רועשת בזוגות',           descriptionHe: 'זוגות. בעיה דומה. אחד פותר ברעש, השני מקשיב. אחר כך מתחלפים. בלי תיקונים — רק האזנה.' },
    { durationMin: 12, titleHe: 'יחיד עם ה-4 צעדים',            descriptionHe: 'דף ובו 4 הצעדים מודפסים. בעיה חדשה. כל תלמיד עובר לבד — אבל עם המבנה.' },
    { durationMin: 8,  titleHe: 'רפלקציה משותפת',                descriptionHe: 'מי השתמש בצעד 3 — ההערכה? מה זה שינה? איזו טעות "כמעט-הייתה"?' },
  ],
  reflectionHe: 'הילדים שתרגלו את "הצעד-3 — הערך לפני שתחשב" — הציון שלהם בבעיות מילוליות עלה ב-20%. לא כי למדו מתמטיקה חדשה. כי למדו לעצור. החשיבה הרועשת היא לא טריק — היא ההזדמנות היחידה של תלמיד לשמוע מומחה שוגה.',
};

// ── EXIT TICKETS ───────────────────────────────────────────────
export const EXIT_DEMO: MethodDemo = {
  id: 'exit',
  nameHe: 'כרטיסי יציאה',
  taglineHe: 'שתי דקות בסוף שיעור. תמונת מצב קוגניטיבית.',
  whenToUseHe: 'כל שיעור שאחריו מתכננים את הבא. כשציון אומר "ידעו" אבל חוש אומר "לא באמת".',
  challengeHe: 'מבחן הראה ש-80% מהכיתה "יודעים" את פוטוסינתזה. אבל כשביקשתי בכיתה "ספרו לי מה קורה לאוויר שאנחנו נושמים אצל הצמח" — קיבלתי 5 הסברים שונים, כולם שגויים. הציון אמר שהם יודעים. המציאות אמרה שהם לא.',
  gradeHe: 'כיתה ז׳',
  subjectHe: 'מדעים',
  prompt: {
    roleHe: 'את מומחית בהערכה מעצבת. את יודעת שיש סוגים שונים של "ידיעה" — וכל סוג דורש שאלה אחרת.',
    contextHe: 'סיימתי שיעור על פוטוסינתזה בכיתה ז׳. רוצה כרטיס יציאה של 2-3 דקות, אבל לא אחד — מבחר.',
    taskHe: 'בני 5 וריאציות שונות של כרטיסי יציאה. כל אחת חושפת ממד קוגניטיבי אחר: (1) הנקודה הכי מבלבלת. (2) יישום ("הסבירי במילים שלך / ציירי"). (3) ניבוי. (4) חיבור. (5) שאלה פתוחה.',
    constraintsHe: 'בעברית. כל כרטיס: כותרת ושאלה ספציפית לפוטוסינתזה, לא כללי.',
  },
  outputs: [
    { labelHe: '01 · הנקודה המבלבלת',  valueHe: '"מה במחזור החיים של הצמח אתם עדיין לא בטוחים שתסבירו לאחותכם הקטנה? משפט אחד."' },
    { labelHe: '02 · יישום במילים',    valueHe: '"בעיגול אחד ובלי מילים מדעיות: ציירו מה קורה לעלה ביום שטוף שמש. בעיגול שני — באותו עלה, בלילה."' },
    { labelHe: '03 · ניבוי',           valueHe: '"מה היה קורה לצמח שמוחזק שבועיים בארון חשוך אבל מקבל מים? מה הוא ישלח לעולם — או לא ישלח?"' },
    { labelHe: '04 · חיבור',           valueHe: '"איך פוטוסינתזה קשורה לפיצה שאכלתם הבוקר? תלכו אחורה — הקמח מאיפה?"' },
    { labelHe: '05 · שאלה פתוחה',      valueHe: '"שאלה אחת שעדיין לא נשאלה היום וגם לא במבחן — אבל אתם רוצים שתישאל. כתבו אותה."' },
  ],
  lesson: [
    { durationMin: 35, titleHe: 'השיעור הרגיל',                  descriptionHe: 'מלמדים את התוכן כמתוכנן. הכרטיס הוא בסוף.' },
    { durationMin: 3,  titleHe: 'בחירת כרטיס',                   descriptionHe: 'מציגה את 5 הסוגים על הלוח. אומרת: "בחרו אחד. זה שמרגיש לכם הכי קרוב לאיפה אתם עכשיו."' },
    { durationMin: 5,  titleHe: 'מילוי בשקט',                    descriptionHe: 'דף קטן. שם ושאלה אחת. 5 דקות בשקט. לא ציון.' },
    { durationMin: 2,  titleHe: 'איסוף ויציאה',                  descriptionHe: 'אוספת לקופסה. הכרטיסים יקראו אחרי השיעור — לא בכיתה.' },
  ],
  reflectionHe: 'מהכרטיסים גיליתי שכמעט חצי כיתה התבלבלו בין פוטוסינתזה לנשימה. השיעור הבא לא התחיל מ"הנושא הבא". הוא התחיל מ"הם חושבים שאני יודעת" — והקדישה 15 דקות לבדיוק לבלבול הזה. ציון המבחן הבא היה ב-15 נקודות יותר גבוה. הכרטיס הוא 5 דקות. הוא חסך לי שיעור שלם של חזרה.',
};

export const ALL_DEMOS: MethodDemo[] = [KWL_DEMO, THINKALOUD_DEMO, EXIT_DEMO];

export const DEMO_BY_ID: Record<TechniqueKey, MethodDemo> = {
  kwl:        KWL_DEMO,
  thinkaloud: THINKALOUD_DEMO,
  exit:       EXIT_DEMO,
};
'@
Write-Source -Path 'src/data/promptCards.ts' -Body @'
// ═══════════════════════════════════════════════════════════════════
// M06 · Prompt cards
// The teacher's metacognition toolkit.
// ═══════════════════════════════════════════════════════════════════
import type { TechniqueKey } from '@/types/module.types';

export interface PromptCard {
  id:           string;
  number:       string;
  nameHe:       string;
  taglineHe:    string;
  whenToUseHe:  string;
  roleHe:       string;
  contextHe:    string;
  taskHe:       string;
  constraintsHe: string;
  exampleHe:    string;
  linkedMethod?: TechniqueKey;
}

export const PROMPT_CARDS: PromptCard[] = [
  {
    id: 'kwl',
    number: '01',
    nameHe: 'מחולל KWL',
    taglineHe: 'מה הם חושבים שהם יודעים, לפני שאלמד אותם.',
    whenToUseHe: 'בפתיחת יחידה חדשה. כדי לגלות תפיסות מוקדמות (גם השגויות) שיעצבו את היחידה.',
    roleHe: 'את/ה מומחה/ית במטא-קוגניציה בכיתה. את/ה יודע/ת ש-KWL ‎(Know-Want to know-Learned)‎ הוא כלי שמקדם מודעות עצמית לידע מוקדם.',
    contextHe: 'אני מתחיל/ה יחידה בנושא [נושא] לכיתה [שכבה] ב[מקצוע]. רוצה לפתוח עם KWL.',
    taskHe: 'בני לי טופס KWL מותאם — שלוש עמודות. ב-K: 5 שאלות מובילות שיוציאו את הידע המוקדם. ב-W: 5 שאלות מעוררות סקרנות. ב-L: 3 שאלות סיכום ליחידה. **הוסיפ/י 5 תפיסות שגויות נפוצות שצפויות לעלות ב-K** — כדי שאדע מראש מה לחפש.',
    constraintsHe: 'בעברית. שפה ברורה לשכבת הגיל הזאת. עמוד אחד מקסימום. אל תחזיר/י תשובות — רק שאלות.',
    exampleHe: 'כיתה ח׳, אזרחות, יחידה על דמוקרטיה. בני לי טופס KWL...',
    linkedMethod: 'kwl',
  },
  {
    id: 'thinkaloud',
    number: '02',
    nameHe: 'תסריט חשיבה רועשת',
    taglineHe: 'המראה את התהליך, לא רק את התשובה.',
    whenToUseHe: 'כשתלמידים יודעים את התשובה אבל לא איך מגיעים אליה. כשסוג שלם של בעיות חוסם אותם.',
    roleHe: 'את/ה מורה מומחה/ית שמדגים/ה לתלמידים את הדיאלוג הפנימי של מומחה — כל מחשבה, כל בלימה, כל תיקון.',
    contextHe: 'אני מלמד/ת [מקצוע] בכיתה [שכבה]. סוג הבעיות שתלמידים נתקעים בו: [תיאור]. דוגמה ספציפית: [בעיה].',
    taskHe: 'כתבי לי תסריט "חשיבה רועשת" מלא לפתרון הבעיה הזאת — בגוף ראשון. כללי: (1) כל מחשבה, גם הראשונית. (2) הסימני-עצירה שלי ("רגע, האם זה באמת מה ש..."). (3) חזרה והערכה (״האם זה הגיוני?״). (4) רגע של "כמעט טעיתי". בסוף — 4 "צעדי-חשיבה" שאני יכולה ללמד את התלמידים להחיל בעצמם.',
    constraintsHe: 'בעברית. 250-400 מילים בתסריט. אל תפשט/י — תני/ן את החשיבה כפי שהיא באמת.',
    exampleHe: 'מורה למתמטיקה כיתה ה, בעיה: שני חברים אכלו 3/8 פיצה כל אחד, כמה נשאר? תסריט חשיבה רועשת...',
    linkedMethod: 'thinkaloud',
  },
  {
    id: 'exit',
    number: '03',
    nameHe: 'חמישיית כרטיסי יציאה',
    taglineHe: 'חמש דרכים שונות לחתום שיעור — כל אחת חושפת משהו אחר.',
    whenToUseHe: 'כשרוצים תמונת מצב מהירה בסוף שיעור. כשציונים אומרים "ידעו" אבל תחושה אומרת "לא באמת".',
    roleHe: 'את/ה מומחה/ית בהערכה מעצבת. את/ה יודע/ת שיש סוגים שונים של "ידיעה" — והם דורשים סוגים שונים של שאלות.',
    contextHe: 'סיימתי שיעור על [נושא] לכיתה [שכבה] ב[מקצוע]. רוצה כרטיס יציאה של 2-3 דקות.',
    taskHe: 'בני/ה לי 5 וריאציות שונות של כרטיסי יציאה. כל אחת חושפת ממד קוגניטיבי אחר: (1) הנקודה הכי מבלבלת, (2) יישום ("הסבירי במילים שלך / ציירי"), (3) ניבוי ("מה היה קורה אם..."), (4) חיבור ("איך זה קשור ל..."), (5) שאלה פתוחה ("שאלה שעוד נשאלת").',
    constraintsHe: 'בעברית. כל כרטיס: כותרת ושאלה ספציפית לנושא. לא כללי.',
    exampleHe: 'כיתה ז, מדעים, שיעור על פוטוסינתזה. בני 5 כרטיסי יציאה...',
    linkedMethod: 'exit',
  },
  {
    id: 'selfquestion',
    number: '04',
    nameHe: 'שאילתות-עצמיות',
    taglineHe: 'הסקריפט שאני רוצה שיתנגן בראש שלהם כשהם תקועים.',
    whenToUseHe: 'כשתלמידים נתקעים ושואלים אותך, ואת/ה רוצה שהם ילמדו לשאול את עצמם.',
    roleHe: 'את/ה מומחה/ית במטא-קוגניציה לתלמידים. את/ה יודע/ת ש-self-questioning הוא אחת המיומנויות המטא-קוגניטיביות החזקות ביותר.',
    contextHe: 'אני מלמד/ת [מקצוע] לכיתה [שכבה]. הסוג של רגע "תקיעות" שאני רואה הכי הרבה: [תיאור — לדוגמה: "תלמיד שמגיע לקטע קשה ופשוט מפסיק לקרוא".]',
    taskHe: 'בני/ה לי רשימה של 6 שאלות שתלמיד יכול לשאול את עצמו ברגע של תקיעות. השאלות צריכות להיות: (1) קצרות מאוד — לזכירה, (2) ספציפיות למצב הזה, (3) פעולה-עוקבת — לא רק "מה אני מרגישה". סדר/י אותן מהקלה אל המעוררת.',
    constraintsHe: 'בעברית. כל שאלה: עד 8 מילים. אל תהיו פילוסופיים.',
    exampleHe: 'מורה לעברית כיתה ד, תקיעות: ילד שמפסיק לקרוא בקטע מורכב. 6 שאלות עצמיות...',
  },
  {
    id: 'misconception',
    number: '05',
    nameHe: 'גשש תפיסות שגויות',
    taglineHe: 'מה הם חושבים שהם יודעים — אבל לא.',
    whenToUseHe: 'לפני שיעור חשוב, או אחרי מבחן שתוצאותיו מבלבלות. כדי לתפוס שגיאת חשיבה במקור.',
    roleHe: 'את/ה חוקר/ת תפיסות שגויות בלמידה. את/ה יודע/ת שתפיסות שגויות אינן חוסר ידע — הן ידע מוטעה שמתחזק.',
    contextHe: 'אני מלמד/ת [נושא] ב[מקצוע] לכיתה [שכבה]. תלמידים אומרים שהם הבינו, אבל המבחנים אומרים אחרת. לפעמים אני חושד/ת שאני יודע/ת איפה הם נופלים.',
    taskHe: 'תני/ן לי: (1) 5 תפיסות שגויות נפוצות ספציפית בנושא הזה לגיל הזה, (2) למה כל אחת נדבקת — מהיכן היא באה, (3) שאלה אחת חכמה שתחשוף את התפיסה אם היא קיימת, (4) פעילות אחת קצרה שתערער אותה.',
    constraintsHe: 'בעברית. אל תחזיר/י תפיסות שגויות גנריות — דווקא הספציפיות והעדינות שמורים מנוסים מפספסים.',
    exampleHe: 'מורה למדעים כיתה ז, נושא פוטוסינתזה. 5 תפיסות שגויות...',
  },
];

export const PROMPT_CARD_BY_ID: Record<string, PromptCard> = PROMPT_CARDS.reduce(
  (acc, c) => { acc[c.id] = c; return acc; },
  {} as Record<string, PromptCard>,
);
'@
Write-Source -Path 'src/data/sections.ts' -Body @'
// ═══════════════════════════════════════════════════════════════════
// M06 · Section flow
//
// Teacher metacognition first, AI later. The teacher experiences her
// own thinking-about-thinking before any tool is introduced.
// ═══════════════════════════════════════════════════════════════════
import type { SectionId, SectionMeta } from '@/types/module.types';

export const SECTIONS: SectionMeta[] = [
  {
    id: 'opening',
    number: 1,
    path: '/opening',
    shortHe: 'פתיחה',
    titleHe: 'מטא-קוגניציה בכיתה',
    subtitleHe: 'למה חשיבה על החשיבה היא ההכפלה הלימודית הכי גדולה — ולמה אתם כבר עושים אותה',
    minutes: 25,
  },
  {
    id: 'thinkaloud',
    number: 2,
    path: '/thinkaloud',
    shortHe: 'הפער',
    titleHe: 'הפער בין מה שכתבתם למה שחשבתם',
    subtitleHe: 'תרגיל חי שחושף את הפער בין התוצר לבין החשיבה שמאחוריו',
    minutes: 20,
  },
  {
    id: 'frameworks',
    number: 3,
    path: '/frameworks',
    shortHe: 'ארבעה כלים',
    titleHe: 'ארבעה כלים מטא-קוגניטיביים',
    subtitleHe: 'KWL, חשיבה רועשת, כרטיסי יציאה, שאילתות-עצמיות. מתי כל אחד עובד.',
    minutes: 15,
  },
  {
    id: 'break',
    number: 4,
    path: '/break',
    shortHe: 'הפסקה',
    titleHe: 'הפסקה · בחירת הכיתה שלכם',
    subtitleHe: 'אוויר ומים, ואז — על איזו יחידה נעבוד בחלק האחרון',
    minutes: 15,
  },
  {
    id: 'ai',
    number: 5,
    path: '/ai',
    shortHe: 'AI נכנס',
    titleHe: 'AI כתשתית חשיבה',
    subtitleHe: 'הוא לא חושב במקום התלמיד. הוא מאפשר לתלמיד לראות איך הוא חושב. חמש כרטיסיות.',
    minutes: 25,
  },
  {
    id: 'methods',
    number: 6,
    path: '/methods',
    shortHe: 'שלוש שיטות',
    titleHe: 'שלוש שיטות עבודה',
    subtitleHe: 'KWL · חשיבה רועשת · כרטיסי יציאה. כל אחת על אתגר כיתתי אמיתי',
    minutes: 35,
  },
  {
    id: 'personal',
    number: 7,
    path: '/personal',
    shortHe: 'השיעור שלכם',
    titleHe: 'השיעור המטא-קוגניטיבי שלכם',
    subtitleHe: 'שיטה אחת, היחידה שלכם, ערכה מוכנה',
    minutes: 30,
  },
  {
    id: 'closing',
    number: 8,
    path: '/closing',
    shortHe: 'סיכום',
    titleHe: 'סיכום',
    subtitleHe: 'ארבעה שיעורים + חמש כרטיסיות. הקיט שלכם',
    minutes: 15,
  },
];

export const SECTION_BY_ID: Record<SectionId, SectionMeta> = SECTIONS.reduce(
  (acc, s) => { acc[s.id] = s; return acc; },
  {} as Record<SectionId, SectionMeta>,
);

export function getSectionIndex(id: SectionId): number {
  return SECTIONS.findIndex(s => s.id === id);
}

export function getNextSection(id: SectionId): SectionMeta | null {
  const i = getSectionIndex(id);
  return i >= 0 && i < SECTIONS.length - 1 ? SECTIONS[i + 1] : null;
}

export function getPrevSection(id: SectionId): SectionMeta | null {
  const i = getSectionIndex(id);
  return i > 0 ? SECTIONS[i - 1] : null;
}

export const TOTAL_MINUTES = SECTIONS.reduce((sum, s) => sum + s.minutes, 0);
'@
Write-Source -Path 'src/hooks/useModuleProgress.ts' -Body @'
// ═══════════════════════════════════════════════════════════════════
// useModuleProgress — localStorage-backed state for module progress.
// Tracks visited/completed per section + custom topic + chosen technique.
// ═══════════════════════════════════════════════════════════════════
import { useCallback, useEffect, useState } from 'react';
import { SECTIONS } from '@/data/sections';
import type {
  CustomTopic,
  ModuleProgress,
  SectionId,
  SectionProgress,
  TechniqueKey,
} from '@/types/module.types';

const STORAGE_KEY = 'binai.m06.progress.v1';
const TOPIC_KEY   = 'binai.m06.topic.v1';

function emptyProgress(): ModuleProgress {
  const sections: Record<SectionId, SectionProgress> = {} as Record<SectionId, SectionProgress>;
  SECTIONS.forEach(s => {
    sections[s.id] = { visited: false, completed: false, completedAt: null };
  });
  return { sections, customTopic: null, personalTechnique: null };
}

function loadProgress(): ModuleProgress {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return emptyProgress();
    const parsed = JSON.parse(raw) as Partial<ModuleProgress>;
    const base = emptyProgress();
    if (parsed.sections) {
      Object.keys(parsed.sections).forEach(k => {
        const id = k as SectionId;
        if (base.sections[id]) {
          base.sections[id] = { ...base.sections[id], ...parsed.sections![id] };
        }
      });
    }
    if (parsed.customTopic) base.customTopic = parsed.customTopic;
    if (parsed.personalTechnique) base.personalTechnique = parsed.personalTechnique;
    return base;
  } catch {
    return emptyProgress();
  }
}

function saveProgress(p: ModuleProgress): void {
  try { localStorage.setItem(STORAGE_KEY, JSON.stringify(p)); } catch { /* private mode */ }
}

function saveTopic(t: CustomTopic | null): void {
  try {
    if (t) localStorage.setItem(TOPIC_KEY, JSON.stringify(t));
    else localStorage.removeItem(TOPIC_KEY);
  } catch { /* noop */ }
}

export function useModuleProgress() {
  const [progress, setProgress] = useState<ModuleProgress>(loadProgress);

  useEffect(() => { saveProgress(progress); }, [progress]);

  const visit = useCallback((id: SectionId) => {
    setProgress(prev => {
      if (prev.sections[id]?.visited) return prev;
      return {
        ...prev,
        sections: {
          ...prev.sections,
          [id]: { ...prev.sections[id], visited: true },
        },
      };
    });
  }, []);

  const complete = useCallback((id: SectionId) => {
    setProgress(prev => ({
      ...prev,
      sections: {
        ...prev.sections,
        [id]: { ...prev.sections[id], visited: true, completed: true, completedAt: Date.now() },
      },
    }));
  }, []);

  const setCustomTopic = useCallback((topic: CustomTopic | null) => {
    setProgress(prev => ({ ...prev, customTopic: topic }));
    saveTopic(topic);
  }, []);

  const setPersonalTechnique = useCallback((tech: TechniqueKey | null) => {
    setProgress(prev => ({ ...prev, personalTechnique: tech }));
  }, []);

  const reset = useCallback(() => {
    const fresh = emptyProgress();
    setProgress(fresh);
    saveTopic(null);
  }, []);

  return {
    progress,
    visit,
    complete,
    setCustomTopic,
    setPersonalTechnique,
    reset,
  };
}
'@
Write-Source -Path 'src/main.tsx' -Body @'
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './styles/global.scss';

// Build ID — bump suffix on each deploy to guarantee a unique bundle hash.
// (Required after the M04 Cloudflare 502-mid-upload incident.)
console.log('M06 build 2026-05-19-2');

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);
'@
Write-Source -Path 'src/router/ModuleRouter.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// ModuleRouter — hash routing for iframe-safety.
// All 8 sections lazy-loaded.
// ═══════════════════════════════════════════════════════════════════
import React, { lazy, Suspense } from 'react';
import { createHashRouter, Navigate, RouterProvider } from 'react-router-dom';
import ModuleShell from '@/components/ModuleShell/ModuleShell';

const OpeningSection    = lazy(() => import('@/sections/01-opening'));
const ThinkAloudSection = lazy(() => import('@/sections/02-thinkaloud'));
const FrameworksSection = lazy(() => import('@/sections/03-frameworks'));
const BreakSection      = lazy(() => import('@/sections/04-break'));
const AISection         = lazy(() => import('@/sections/05-ai'));
const MethodsSection    = lazy(() => import('@/sections/06-methods'));
const PersonalSection   = lazy(() => import('@/sections/07-personal'));
const ClosingSection    = lazy(() => import('@/sections/08-closing'));

const withSuspense = (el: React.ReactNode) => (
  <Suspense fallback={null}>{el}</Suspense>
);

const router = createHashRouter([
  {
    path: '/',
    element: <ModuleShell />,
    children: [
      { index: true,         element: <Navigate to="/opening" replace /> },
      { path: 'opening',     element: withSuspense(<OpeningSection />)    },
      { path: 'thinkaloud',  element: withSuspense(<ThinkAloudSection />) },
      { path: 'frameworks',  element: withSuspense(<FrameworksSection />) },
      { path: 'break',       element: withSuspense(<BreakSection />)      },
      { path: 'ai',          element: withSuspense(<AISection />)         },
      { path: 'methods',     element: withSuspense(<MethodsSection />)    },
      { path: 'personal',    element: withSuspense(<PersonalSection />)   },
      { path: 'closing',     element: withSuspense(<ClosingSection />)    },
      { path: '*',           element: <Navigate to="/opening" replace />  },
    ],
  },
]);

const ModuleRouter: React.FC = () => <RouterProvider router={router} />;
export default ModuleRouter;
'@
Write-Source -Path 'src/sections/01-opening/LearningCase.module.scss' -Body @'
.section {
  @include flex-col;
  gap: $space-6;
}

.head {
  @include flex-col;
  gap: $space-3;
}

.eyebrow { @include eyebrow; }
.title   { @include headline-section; }

.lede {
  @include lede;
  max-width: $content-narrow;

  em {
    @include accent-underline;
    font-style: normal;
  }
}

.list {
  list-style: none;
  margin: 0;
  padding: 0;
  @include flex-col;
  gap: $space-6;
}

.item {
  display: grid;
  grid-template-columns: 36px 1fr;
  gap: $space-4;
  padding-bottom: $space-5;
  border-bottom: $border-subtle;

  &:last-child { border-bottom: none; padding-bottom: 0; }
}

.num {
  font-family: $font-mono;
  font-size: $text-md;
  font-weight: $weight-regular;
  color: $accent;
  letter-spacing: 0.02em;
  padding-top: 2px;
}

.text {
  @include flex-col;
  gap: $space-2;
  min-width: 0;
}

.itemTitle {
  @include headline-subsection;
  font-weight: $weight-regular;
}

.itemBody { @include body-paragraph; }

.itemSource {
  @include eyebrow;
  margin-top: $space-1;
  color: $ink-soft;
  font-size: 11px;
  text-transform: none;
  letter-spacing: 0.02em;
}

.pull {
  @include pull-quote;
  padding: $space-5 $space-6;
  border-inline-start: 2px solid $accent;
  background: $accent-faint;
  font-style: italic;
  margin-top: $space-3;
}
'@
Write-Source -Path 'src/sections/01-opening/LearningCase.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// LearningCase — three reasons metacognition matters for student
// learning. Evidence-grounded.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './LearningCase.module.scss';

interface Reason {
  number: string;
  title: string;
  body: string;
  source: string;
}

const REASONS: Reason[] = [
  {
    number: '01',
    title: 'השפעה של כמעט שנת לימוד נוספת',
    body: 'במטא-אנליזה של ג׳ון האטי על למעלה מ-800 מחקרים, אסטרטגיות מטא-קוגניטיביות מקבלות גודל-השפעה של d ≈ 0.69 — מה ששווה לכמעט שנת לימוד שלמה נוספת לתלמיד. רק חזרה מרווחת ובדיקה עצמית מתחרות בעוצמה הזאת.',
    source: "Hattie · Visible Learning · 2009/2023",
  },
  {
    number: '02',
    title: 'הטכניקות החזקות ביותר — כולן מטא-קוגניטיביות',
    body: 'מחקר השוואתי של 10 טכניקות לימוד מצא ששלוש בעלות התועלת הגבוהה ביותר — בדיקה עצמית, פרקטיקה מרווחת, והסבר עצמי — כולן מסתמכות על מודעות התלמיד לתהליך הלמידה שלו. דגשנים כמו "הדגשה" ו"קריאה חוזרת" — נמצאו כמעט לא יעילים.',
    source: 'Dunlosky et al · Improving Students Learning · 2013',
  },
  {
    number: '03',
    title: 'משפיע יותר על מי שהכי זקוק לעזרה',
    body: 'תלמידים חזקים כבר מפעילים מטא-קוגניציה באופן לא-מודע. תלמידים מתקשים — לא. כשהמיומנות נלמדת במפורש, הפער מצטמצם. זה אחד מהמהלכים הפדגוגיים היחידים שמשפיעים יותר על תלמידים חלשים מאשר על חזקים.',
    source: 'EEF · Teaching & Learning Toolkit · 2021',
  },
];

const LearningCase: React.FC = () => (
  <section className={styles.section}>
    <header className={styles.head}>
      <span className={styles.eyebrow}>למה זה חשוב</span>
      <h2 className={styles.title}>שלוש סיבות פדגוגיות — לפני שמדברים על AI.</h2>
      <p className={styles.lede}>
        מטא-קוגניציה היא לא מילה אופנתית. היא <em>אחת המיומנויות החזקות
        ביותר</em> שאפשר ללמד תלמיד — לפי כל מחקר רציני בעשרים השנים האחרונות.
      </p>
    </header>

    <ol className={styles.list}>
      {REASONS.map(r => (
        <li key={r.number} className={styles.item}>
          <span className={styles.num}>{r.number}</span>
          <div className={styles.text}>
            <h3 className={styles.itemTitle}>{r.title}</h3>
            <p className={styles.itemBody}>{r.body}</p>
            <p className={styles.itemSource}>{r.source}</p>
          </div>
        </li>
      ))}
    </ol>

    <aside className={styles.pull}>
      "תלמיד שיודע איך הוא יודע — מנצח את התלמיד שיודע יותר."
    </aside>
  </section>
);

export default LearningCase;
'@
Write-Source -Path 'src/sections/01-opening/PersonalReframe.module.scss' -Body @'
.section {
  @include flex-col;
  gap: $space-5;
}

.head { @include flex-col; gap: $space-3; }

.eyebrow { @include eyebrow; }

.title {
  @include headline-section;

  em {
    @include accent-underline;
    font-style: normal;
  }
}

.lede {
  @include lede;
  max-width: $content-narrow;
}

.moments {
  list-style: none;
  margin: 0;
  padding: 0;
  @include flex-col;
  gap: $space-3;
}

.moment {
  display: grid;
  grid-template-columns: 8px 1fr;
  gap: $space-4;
  align-items: baseline;
  padding: $space-3 0;
  font-family: $font-body;
  font-size: $text-base;
  line-height: $leading-loose;
  color: $ink-mid;
  font-weight: $weight-light;
}

.dot {
  width: 4px;
  height: 4px;
  margin-top: 10px;
  border-radius: 50%;
  background: $accent;
}

.bridge {
  @include flex-col;
  gap: $space-3;
  margin-top: $space-4;
  padding-top: $space-5;
}

.rule { @include micro-rule(48px); }

.bridgeText {
  @include body-paragraph;
  max-width: $content-narrow;

  strong { color: $ink; font-weight: $weight-medium; }
}

.bridgeNext {
  font-family: $font-display;
  font-size: $text-md;
  font-weight: $weight-light;
  color: $ink;
  font-style: italic;
}
'@
Write-Source -Path 'src/sections/01-opening/PersonalReframe.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// PersonalReframe — the teacher already practices metacognition every
// day. The workshop won't add a "new skill" — it'll name what they
// already do and make it teachable.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './PersonalReframe.module.scss';

const MOMENTS: string[] = [
  'מתי תכננתם שיעור ועצרתם לשאול: "מה יכול לקרוס פה?"',
  'מתי באמצע שיעור החלפתם את ההסבר כי הבחנתם בעיניים מבולבלות?',
  'מתי שאלתם תלמיד "איך הגעת לתשובה הזאת?" — לא בודק תשובה, בודק תהליך?',
  'מתי בסוף שיעור חשבתם "בפעם הבאה אני אעשה זה אחרת" — וזה היה ברור למה?',
];

const PersonalReframe: React.FC = () => (
  <section className={styles.section}>
    <header className={styles.head}>
      <span className={styles.eyebrow}>אתם כבר עושים את זה</span>
      <h2 className={styles.title}>
        מטא-קוגניציה היא לא <em>מילה חדשה</em>. היא מה שאתם עושים כל יום.
      </h2>
      <p className={styles.lede}>
        רוב המורים אומרים "אני לא מומחה למטא-קוגניציה". זה כמעט תמיד לא נכון.
        מורים טובים מפעילים אותה על עצמם בלי הפסקה — לפני, תוך כדי, ואחרי
        השיעור. הנה ארבעה רגעים שלכם בחודש האחרון:
      </p>
    </header>

    <ul className={styles.moments}>
      {MOMENTS.map((m, i) => (
        <li key={i} className={styles.moment}>
          <span className={styles.dot} aria-hidden />
          <span>{m}</span>
        </li>
      ))}
    </ul>

    <div className={styles.bridge}>
      <hr className={styles.rule} aria-hidden />
      <p className={styles.bridgeText}>
        כל אלה — מטא-קוגניציה. ההשתלמות הזאת לא מלמדת אתכם מיומנות חדשה. היא
        תיתן לכם <strong>שמות ומבנים</strong> למה שאתם כבר עושים — כדי שתוכלו
        ללמד את התלמידים לעשות זאת בעצמם.
      </p>
      <p className={styles.bridgeNext}>
        בחלק הבא — תרגיל קצר. שיראה משהו חשוב על עצמכם.
      </p>
    </div>
  </section>
);

export default PersonalReframe;
'@
Write-Source -Path 'src/sections/01-opening/index.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// Section 01 — מטא-קוגניציה בכיתה (25 min)
//
// Two beats:
//   1. Why metacognition matters for student learning (evidence)
//   2. The teacher already practices it — reframe
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import LearningCase from './LearningCase';
import PersonalReframe from './PersonalReframe';

const OpeningSection: React.FC = () => (
  <SectionShell id="opening">
    <LearningCase />
    <PersonalReframe />
  </SectionShell>
);

export default OpeningSection;
'@
Write-Source -Path 'src/sections/02-thinkaloud/GapExercise.module.scss' -Body @'
.section {
  @include flex-col;
  gap: $space-5;
  padding: $space-6;
  background: $bg-surface;
  border: $border-hair;
  border-radius: $radius-md;
}

// ── PHASE TABS ─────────────────────────────────────────────────
.phaseTabs {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 0;
  border-bottom: $border-subtle;
}

.tab {
  @include focus-ring;
  display: flex;
  align-items: baseline;
  gap: $space-2;
  padding: $space-3 $space-4;
  background: none;
  border: none;
  border-bottom: 2px solid transparent;
  cursor: pointer;
  color: $ink-soft;
  transition: color $dur-fast $ease-out;
  text-align: start;

  &:hover:not(:disabled) { color: $ink-mid; }
  &:disabled { opacity: 0.4; cursor: not-allowed; }
}

.tabNum {
  font-family: $font-mono;
  font-size: 11px;
  color: $ink-faint;
  letter-spacing: 0.04em;
}

.tabLabel {
  font-family: $font-body;
  font-size: $text-sm;
  font-weight: $weight-regular;
}

.tabActive {
  color: $ink !important;
  border-bottom-color: $accent !important;

  .tabNum { color: $accent; }
  .tabLabel { font-weight: $weight-medium; }
}

// ── PHASE BODY ─────────────────────────────────────────────────
.phase { @include flex-col; gap: $space-4; }

.phaseTitle {
  @include headline-subsection;
}

.phaseHint {
  @include body-paragraph;

  strong { font-weight: $weight-medium; color: $accent; }
  em { font-style: italic; color: $ink; }
}

// ── INPUTS ─────────────────────────────────────────────────────
.textarea {
  @include field-base;
  resize: vertical;
  min-height: 120px;
  line-height: $leading-loose;
}

.checklist {
  list-style: none;
  margin: 0;
  padding: 0 $space-5 0 0;
  @include flex-col;
  gap: $space-2;

  li {
    @include body-paragraph;
    font-size: $text-sm;
    padding-inline-start: $space-4;
    position: relative;

    &::before {
      content: '·';
      position: absolute;
      inset-inline-start: 0;
      top: -2px;
      color: $accent;
      font-size: 22px;
      line-height: 1;
    }
  }
}

// ── FOOTER ─────────────────────────────────────────────────────
.phaseFooter {
  @include flex-between;
  gap: $space-3;
  padding-top: $space-3;
  border-top: $border-subtle;
}

.counter {
  font-family: $font-mono;
  font-size: $text-md;
  color: $ink;

  em {
    color: $ink-faint;
    font-style: normal;
    font-size: $text-xs;
    margin-inline-start: 4px;
  }
}

.next {
  @include btn-primary;
  display: inline-flex;
  align-items: center;
  gap: $space-2;

  svg { font-size: 16px; }
}

.back { @include btn-link; }

// ── COMPARE (PHASE 3) ──────────────────────────────────────────
.compare {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  gap: $space-5;
  align-items: center;
  padding: $space-7 0;
  border-top: $border-subtle;
  border-bottom: $border-subtle;

  @media (max-width: $bp-sm) {
    grid-template-columns: 1fr;
    gap: $space-4;
  }
}

.col {
  @include flex-col;
  gap: $space-1;
  align-items: center;
  text-align: center;
}

.colLabel {
  @include eyebrow;
  color: $ink-soft;
}

.colNum {
  font-family: $font-display;
  font-size: $text-4xl;
  font-weight: $weight-light;
  line-height: 1;
  color: $ink;
  letter-spacing: -0.02em;
}

.colNumAccent { color: $accent; }

.colUnit {
  @include eyebrow;
  color: $ink-faint;
}

.colMid {
  font-family: $font-mono;
  font-size: $text-xl;
  color: $ink-faint;
  text-align: center;

  @media (max-width: $bp-sm) { display: none; }
}

.ratio {
  @include body-paragraph;
  text-align: center;
  font-style: italic;
  color: $ink-mid;
  margin-top: -$space-3;

  strong {
    color: $accent;
    font-weight: $weight-medium;
    font-style: normal;
  }
}

.takeaway {
  @include flex-col;
  gap: $space-3;
  padding: $space-5 $space-6;
  background: $accent-faint;
  border-radius: $radius-md;
  margin-top: $space-3;

  p {
    @include body-paragraph;
    color: $ink;
    margin: 0;
  }

  strong { color: $accent-deep; font-weight: $weight-medium; }
  em {
    @include accent-underline;
    font-style: normal;
  }
}
'@
Write-Source -Path 'src/sections/02-thinkaloud/GapExercise.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// GapExercise — 3-phase live exercise.
// Phase 1: 60-second quick draft of a teaching opener
// Phase 2: 5-minute expansion of the FULL thinking that produced it
// Phase 3: comparison — count of words/lines on each
// All state persists in localStorage.
// ═══════════════════════════════════════════════════════════════════
import React, { useEffect, useMemo, useState } from 'react';
import { TbArrowLeft } from 'react-icons/tb';
import styles from './GapExercise.module.scss';

const KEY_DRAFT  = 'binai.m06.gap.draft.v1';
const KEY_THINK  = 'binai.m06.gap.thinking.v1';

type Phase = 1 | 2 | 3;

function loadStr(key: string, fallback: string): string {
  try { return localStorage.getItem(key) ?? fallback; } catch { return fallback; }
}
function saveStr(key: string, value: string): void {
  try { localStorage.setItem(key, value); } catch { /* noop */ }
}

function wordCount(s: string): number {
  return s.trim() === '' ? 0 : s.trim().split(/\s+/).length;
}

const GapExercise: React.FC = () => {
  const [phase, setPhase] = useState<Phase>(1);
  const [draft, setDraft]       = useState<string>(() => loadStr(KEY_DRAFT, ''));
  const [thinking, setThinking] = useState<string>(() => loadStr(KEY_THINK, ''));

  useEffect(() => { saveStr(KEY_DRAFT, draft);    }, [draft]);
  useEffect(() => { saveStr(KEY_THINK, thinking); }, [thinking]);

  const draftWords    = useMemo(() => wordCount(draft),    [draft]);
  const thinkingWords = useMemo(() => wordCount(thinking), [thinking]);
  const ratio         = useMemo(
    () => draftWords > 0 ? Math.round(thinkingWords / draftWords) : 0,
    [draftWords, thinkingWords],
  );

  const canAdvanceFrom1 = draftWords >= 10;
  const canAdvanceFrom2 = thinkingWords >= 30;

  return (
    <section className={styles.section}>
      <div className={styles.phaseTabs} aria-label="שלב נוכחי">
        {[1, 2, 3].map(n => (
          <button
            key={n}
            type="button"
            className={[styles.tab, phase === n && styles.tabActive].filter(Boolean).join(' ')}
            onClick={() => {
              if (n === 1) setPhase(1);
              if (n === 2 && canAdvanceFrom1) setPhase(2);
              if (n === 3 && canAdvanceFrom1 && canAdvanceFrom2) setPhase(3);
            }}
            disabled={
              (n === 2 && !canAdvanceFrom1) ||
              (n === 3 && !(canAdvanceFrom1 && canAdvanceFrom2))
            }
          >
            <span className={styles.tabNum}>0{n}</span>
            <span className={styles.tabLabel}>
              {n === 1 ? 'התוצר' : n === 2 ? 'החשיבה' : 'הפער'}
            </span>
          </button>
        ))}
      </div>

      {/* PHASE 1 — quick draft */}
      {phase === 1 && (
        <div className={styles.phase}>
          <h3 className={styles.phaseTitle}>פתיחה לשיעור על שברים, כיתה ד׳ · 60 שניות</h3>
          <p className={styles.phaseHint}>
            רגע — לפני שאתם מתחילים: <strong>אל תחשבו על מה שאתם חושבים.</strong>
            פשוט כתבו את הפתיחה. כאילו אתם בלוח השעות, שיעור עוד 90 שניות,
            וצריך משהו על הרגליים. <em>שתי שורות, שלוש שורות, מקסימום.</em>
          </p>
          <textarea
            className={styles.textarea}
            value={draft}
            onChange={e => setDraft(e.target.value)}
            placeholder="הפתיחה שלי..."
            rows={5}
          />
          <div className={styles.phaseFooter}>
            <span className={styles.counter}>
              {draftWords} <em>מילים</em>
            </span>
            <button
              type="button"
              className={styles.next}
              onClick={() => setPhase(2)}
              disabled={!canAdvanceFrom1}
            >
              <span>עכשיו — החשיבה</span>
              <TbArrowLeft aria-hidden />
            </button>
          </div>
        </div>
      )}

      {/* PHASE 2 — the thinking behind */}
      {phase === 2 && (
        <div className={styles.phase}>
          <h3 className={styles.phaseTitle}>5 דקות · כל מה שעבר בראש</h3>
          <p className={styles.phaseHint}>
            עכשיו — כתבו את <strong>החשיבה</strong>. הכל. כולל:
          </p>
          <ul className={styles.checklist}>
            <li>הרעיון הראשון שדחיתם (למה דחיתם?)</li>
            <li>מה הנחתם על התלמידים — בלי לבדוק</li>
            <li>אנלוגיה שכמעט בחרתם והחלפתם</li>
            <li>"רגע — האם זה באמת..." — היסוס שעצרתם בו</li>
            <li>זיכרון מקצועי שכיוון אתכם ("פעם, עם כיתה ג, ניסיתי...")</li>
          </ul>
          <textarea
            className={styles.textarea}
            value={thinking}
            onChange={e => setThinking(e.target.value)}
            placeholder="אז קודם חשבתי על... אבל אז זכרתי ש... אז הנחתי ש..."
            rows={12}
          />
          <div className={styles.phaseFooter}>
            <button type="button" className={styles.back} onClick={() => setPhase(1)}>← חזרה</button>
            <span className={styles.counter}>
              {thinkingWords} <em>מילים</em>
            </span>
            <button
              type="button"
              className={styles.next}
              onClick={() => setPhase(3)}
              disabled={!canAdvanceFrom2}
            >
              <span>השוו</span>
              <TbArrowLeft aria-hidden />
            </button>
          </div>
        </div>
      )}

      {/* PHASE 3 — the gap */}
      {phase === 3 && (
        <div className={styles.phase}>
          <h3 className={styles.phaseTitle}>הפער</h3>
          <div className={styles.compare}>
            <div className={styles.col}>
              <span className={styles.colLabel}>התוצר</span>
              <span className={styles.colNum}>{draftWords}</span>
              <span className={styles.colUnit}>מילים</span>
            </div>
            <div className={styles.colMid} aria-hidden>×</div>
            <div className={styles.col}>
              <span className={styles.colLabel}>החשיבה</span>
              <span className={[styles.colNum, styles.colNumAccent].join(' ')}>{thinkingWords}</span>
              <span className={styles.colUnit}>מילים</span>
            </div>
          </div>

          {ratio > 0 && (
            <p className={styles.ratio}>
              החשיבה שלכם הייתה <strong>פי {ratio}</strong> ארוכה מהתוצר.
              {ratio >= 4 && ' זה ממוצע — מורים מנוסים מגיעים לפי 5 ופי 6.'}
            </p>
          )}

          <aside className={styles.takeaway}>
            <p>
              <strong>מה שהתלמיד רואה</strong> — התוצר. השאלה שאתם שואלים אותו.
              ההסבר שאתם נותנים. ההחלטה שעשיתם.
            </p>
            <p>
              <strong>מה שהתלמיד לא רואה</strong> — את החשיבה שמאחורי. את 10 הרעיונות
              שדחיתם, את 3 ההנחות שעשיתם, את "כמעט-טעיתי" שלא קרה לכם. <em>מטא-קוגניציה
              היא הזמנה לתלמיד אל הצד הזה</em>.
            </p>
          </aside>

          <div className={styles.phaseFooter}>
            <button type="button" className={styles.back} onClick={() => setPhase(2)}>← חזרה</button>
          </div>
        </div>
      )}
    </section>
  );
};

export default GapExercise;
'@
Write-Source -Path 'src/sections/02-thinkaloud/GapIntro.module.scss' -Body @'
.section { @include flex-col; gap: $space-3; }

.eyebrow { @include eyebrow; }

.title {
  @include headline-section;
  font-weight: $weight-light;
}

.lede {
  @include lede;
  max-width: $content-narrow;

  em {
    @include accent-underline;
    font-style: normal;
  }
}

.steps {
  list-style: none;
  margin: $space-4 0 0;
  padding: 0;
  @include flex-col;
  gap: $space-3;

  li {
    font-family: $font-body;
    font-size: $text-base;
    color: $ink-mid;
    padding-inline-start: $space-5;
    position: relative;
    line-height: $leading-loose;

    span {
      display: inline-block;
      min-width: 64px;
      @include eyebrow;
      color: $accent;
      margin-inline-end: $space-2;
    }
  }
}
'@
Write-Source -Path 'src/sections/02-thinkaloud/GapIntro.tsx' -Body @'
import React from 'react';
import styles from './GapIntro.module.scss';

const GapIntro: React.FC = () => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>תרגיל חי · ⌗ 1</span>
    <h2 className={styles.title}>
      תוצאה קצרה. חשיבה ארוכה. הפער הזה — הוא ההוראה.
    </h2>
    <p className={styles.lede}>
      בשני התרגילים הבאים תכתבו פעמיים. בפעם הראשונה — <em>התוצר</em>: מערך
      פתיחה מהיר. בפעם השנייה — <em>החשיבה שמאחורי</em>. נראה מה שני אלה
      אומרים זה על זה.
    </p>

    <ol className={styles.steps}>
      <li><span>שלב 1</span> 60 שניות. תכננו פתיחה לשיעור על שברים, כיתה ד׳.</li>
      <li><span>שלב 2</span> 5 דקות. כתבו את כל מה שעבר לכם בראש בזמן השלב 1.</li>
      <li><span>שלב 3</span> השוו. תופתעו.</li>
    </ol>
  </section>
);

export default GapIntro;
'@
Write-Source -Path 'src/sections/02-thinkaloud/GapReflection.module.scss' -Body @'
.section { @include flex-col; gap: $space-5; }

.eyebrow { @include eyebrow; }

.title {
  @include headline-section;
  font-weight: $weight-light;

  em {
    @include accent-underline;
    font-style: normal;
  }
}

.split {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: $space-7;
  padding: $space-5 0;
  border-top: $border-subtle;
  border-bottom: $border-subtle;

  @media (max-width: $bp-md) {
    grid-template-columns: 1fr;
    gap: $space-5;
  }
}

.col { @include flex-col; gap: $space-2; }

.colTitle {
  display: flex;
  align-items: baseline;
  gap: $space-2;
  font-family: $font-display;
  font-size: $text-xl;
  font-weight: $weight-regular;
  color: $ink;
}

.colNum {
  font-family: $font-mono;
  font-size: $text-base;
  color: $accent;
  letter-spacing: 0.02em;
}

.colBody {
  @include body-paragraph;

  em {
    @include accent-underline;
    font-style: normal;
  }
}

.takeaway {
  @include flex-col;
  gap: $space-3;
  padding: $space-5;
  background: $accent-faint;
  border-radius: $radius-md;

  p {
    @include body-paragraph;
    color: $ink;
  }

  strong {
    color: $accent-deep;
    font-weight: $weight-medium;
  }
}

.rule { @include micro-rule(40px); }

.next {
  font-style: italic;
  color: $ink-mid !important;
}
'@
Write-Source -Path 'src/sections/02-thinkaloud/GapReflection.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// GapReflection — names the cognitive move just exercised.
// The gap between draft and thinking IS metacognition.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './GapReflection.module.scss';

const GapReflection: React.FC = () => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>מה הרגע עשיתם</span>
    <h2 className={styles.title}>
      בדיוק עשיתם מטא-קוגניציה <em>על עצמכם</em>.
    </h2>

    <div className={styles.split}>
      <div className={styles.col}>
        <h3 className={styles.colTitle}>
          <span className={styles.colNum}>01</span>
          חשבתם
        </h3>
        <p className={styles.colBody}>
          תכננתם פתיחה — לכאורה פעולה אחת. בפועל: 10-20 פעולות-משנה, רובן
          לא-מודעות. רעיונות שעלו ונדחו. הנחות שעשיתם. אנלוגיות שניסיתם
          וזרקתם.
        </p>
      </div>
      <div className={styles.col}>
        <h3 className={styles.colTitle}>
          <span className={styles.colNum}>02</span>
          חשבתם על החשיבה
        </h3>
        <p className={styles.colBody}>
          הסתכלתם אחורה ופירקתם את הרצף. שאלתם את עצמכם "מה הנחתי?". זיהיתם
          את "כמעט-טעיתי". זה <em>בדיוק</em> מה שמטא-קוגניציה היא.
        </p>
      </div>
    </div>

    <aside className={styles.takeaway}>
      <hr className={styles.rule} aria-hidden />
      <p>
        <strong>ההזדמנות הפדגוגית:</strong> רוב התלמידים פועלים על מצב 01
        בלבד. הם חושבים, אבל לא רואים את החשיבה שלהם. <strong>תפקיד המורה</strong> —
        בעזרת או בלי AI — הוא ללמד אותם את המצב השני. את היכולת להסתכל אחורה
        ולשאול "מה עשיתי שם, בעצם?".
      </p>
      <p className={styles.next}>
        בחלק הבא — ארבעה כלים מתורגלים בכיתה. כדי לעבור מ"אני עושה את זה" אל
        "אני יודעת ללמד את זה".
      </p>
    </aside>
  </section>
);

export default GapReflection;
'@
Write-Source -Path 'src/sections/02-thinkaloud/index.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// Section 02 — הפער (20 min)
//
// Three-phase live exercise:
//   1. SOLVE: in 60 seconds, draft a teaching opener for a topic
//   2. EXPAND: in 5 minutes, write every thought that went into the draft
//   3. NOTICE: compare lengths. Most teaching thinking is invisible.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import GapIntro from './GapIntro';
import GapExercise from './GapExercise';
import GapReflection from './GapReflection';

const ThinkAloudSection: React.FC = () => (
  <SectionShell id="thinkaloud">
    <GapIntro />
    <GapExercise />
    <GapReflection />
  </SectionShell>
);

export default ThinkAloudSection;
'@
Write-Source -Path 'src/sections/03-frameworks/FourTools.module.scss' -Body @'
.section { @include flex-col; gap: $space-5; }

.head { @include flex-col; gap: $space-3; }

.eyebrow { @include eyebrow; }
.title   { @include headline-section; font-weight: $weight-light; }

.lede {
  @include lede;
  max-width: $content-narrow;

  em {
    @include accent-underline;
    font-style: normal;
  }
}

.grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: $space-5;

  @media (max-width: $bp-md) {
    grid-template-columns: 1fr;
  }
}

.tool {
  @include flex-col;
  gap: $space-3;
  padding: $space-5;
  background: $bg-surface;
  border: $border-hair;
  border-radius: $radius-md;
}

.toolHead {
  display: grid;
  grid-template-columns: 40px 1fr;
  gap: $space-3;
  align-items: baseline;
  padding-bottom: $space-2;
  border-bottom: $border-subtle;
}

.num {
  font-family: $font-mono;
  font-size: $text-md;
  color: $accent;
  letter-spacing: 0.02em;
}

.toolName {
  font-family: $font-display;
  font-size: $text-lg;
  font-weight: $weight-medium;
  color: $ink;
  line-height: 1.2;
}

.toolEn {
  @include eyebrow;
  text-transform: none;
  letter-spacing: 0.04em;
  color: $ink-soft;
  font-size: 11px;
}

.row { @include flex-col; gap: 2px; padding: $space-2 0; }

.rowLabel { @include eyebrow; color: $ink-soft; }

.row p {
  @include body-paragraph;
  font-size: $text-sm;
}

.example {
  font-style: italic;
  color: $ink !important;
}

.source {
  @include eyebrow;
  margin-top: $space-2;
  padding-top: $space-2;
  border-top: $border-subtle;
  color: $ink-faint;
  font-size: 10px;
  text-transform: none;
  letter-spacing: 0.04em;
}
'@
Write-Source -Path 'src/sections/03-frameworks/FourTools.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// FourTools — four classic metacognitive tools. Each has a moment
// where it fits, and a one-line classroom example.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './FourTools.module.scss';

interface Tool {
  id: string;
  number: string;
  nameHe: string;
  englishHe: string;
  whenHe: string;
  exampleHe: string;
  ledByHe: string;
}

const TOOLS: Tool[] = [
  {
    id: 'kwl',
    number: '01',
    nameHe: 'KWL',
    englishHe: 'Know · Want to know · Learned',
    whenHe: 'בפתיחת יחידה.',
    exampleHe: 'לפני יחידה על דמוקרטיה — מה אתם חושבים שאתם יודעים? מה אתם רוצים לדעת?',
    ledByHe: 'אוגדל · 1986',
  },
  {
    id: 'thinkaloud',
    number: '02',
    nameHe: 'חשיבה רועשת',
    englishHe: 'Think-Aloud',
    whenHe: 'כשתלמידים יודעים תשובה אך לא תהליך.',
    exampleHe: 'במקום "הנה התשובה" — "בואו אדבר דרך זה. קודם אני שואל את עצמי..."',
    ledByHe: 'Ericsson & Simon · 1980',
  },
  {
    id: 'exit',
    number: '03',
    nameHe: 'כרטיסי יציאה',
    englishHe: 'Exit Tickets',
    whenHe: 'בסוף שיעור — תמונת מצב מהירה.',
    exampleHe: '"מה הנקודה הכי מבלבלת אצלך כרגע מתוך השיעור?" — 60 שניות, דף קטן.',
    ledByHe: 'Marzano · Formative Assessment · 2007',
  },
  {
    id: 'selfquestion',
    number: '04',
    nameHe: 'שאילתות עצמיות',
    englishHe: 'Self-Questioning',
    whenHe: 'כשהתלמיד תקוע — כדי שיתשאל את עצמו, לא אותך.',
    exampleHe: '6 שאלות מודבקות לסוף הספר. "מה השאלה האמיתית?", "מה אני כבר יודע?", "האם בדקתי?".',
    ledByHe: 'Wong · Self-Questioning · 1985',
  },
];

const FourTools: React.FC = () => (
  <section className={styles.section}>
    <header className={styles.head}>
      <span className={styles.eyebrow}>ארבעת הכלים הקלאסיים</span>
      <h2 className={styles.title}>ארבעה כלים — לארבעה רגעים בשיעור.</h2>
      <p className={styles.lede}>
        אין כלי "אחד שעובד". יש <em>רגעים</em> — לכל אחד מהם, כלי. הבחירה בכלי
        הנכון לרגע הנכון — היא רוב המיומנות.
      </p>
    </header>

    <div className={styles.grid}>
      {TOOLS.map(t => (
        <article key={t.id} className={styles.tool}>
          <header className={styles.toolHead}>
            <span className={styles.num}>{t.number}</span>
            <div>
              <h3 className={styles.toolName}>{t.nameHe}</h3>
              <span className={styles.toolEn}>{t.englishHe}</span>
            </div>
          </header>

          <div className={styles.row}>
            <span className={styles.rowLabel}>מתי</span>
            <p>{t.whenHe}</p>
          </div>
          <div className={styles.row}>
            <span className={styles.rowLabel}>איך זה נשמע בכיתה</span>
            <p className={styles.example}>{t.exampleHe}</p>
          </div>
          <p className={styles.source}>{t.ledByHe}</p>
        </article>
      ))}
    </div>
  </section>
);

export default FourTools;
'@
Write-Source -Path 'src/sections/03-frameworks/MetacogLoop.module.scss' -Body @'
.section {
  @include flex-col;
  gap: $space-5;
  margin-top: $space-3;
}

.eyebrow { @include eyebrow; }
.title   { @include headline-section; font-weight: $weight-light; }

.flow {
  list-style: none;
  margin: 0;
  padding: 0;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: $space-3;

  @media (max-width: $bp-md) {
    grid-template-columns: 1fr;
    gap: $space-4;
  }
}

.phase {
  @include flex-col;
  gap: $space-3;
  padding: $space-4;
  background: $bg-surface;
  border: $border-hair;
  border-radius: $radius-md;
  position: relative;
}

.phaseHead {
  display: grid;
  grid-template-columns: 32px 1fr;
  gap: $space-2;
  align-items: baseline;
}

.num {
  font-family: $font-mono;
  font-size: $text-sm;
  color: $accent;
  letter-spacing: 0.02em;
}

.phaseTitle {
  font-family: $font-display;
  font-size: $text-md;
  font-weight: $weight-regular;
  color: $ink;
  line-height: 1.2;
}

.phaseEn {
  @include eyebrow;
  text-transform: none;
  letter-spacing: 0.04em;
  color: $ink-soft;
  font-size: 10px;
}

.phaseBody {
  @include body-paragraph;
  font-size: $text-sm;
}

.phaseQuestion {
  font-family: $font-display;
  font-size: $text-sm;
  color: $accent;
  font-style: italic;
  padding-top: $space-2;
  border-top: $border-subtle;
  margin-top: auto;
}

.arrow {
  position: absolute;
  left: -14px;
  top: 50%;
  transform: translateY(-50%);
  font-family: $font-mono;
  color: $accent;
  font-size: 18px;
  pointer-events: none;

  @media (max-width: $bp-md) {
    left: 50%;
    top: auto;
    bottom: -22px;
    transform: translateX(-50%) rotate(-90deg);
  }
}

.coda {
  @include body-paragraph;
  padding: $space-4 $space-5;
  background: $accent-faint;
  border-radius: $radius-md;
  color: $ink;

  strong {
    font-weight: $weight-medium;
    color: $accent-deep;
  }
}
'@
Write-Source -Path 'src/sections/03-frameworks/MetacogLoop.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// MetacogLoop — the underlying 3-phase metacognitive cycle:
//   Plan → Monitor → Evaluate
// All four tools above are variations on this loop, applied at
// different moments.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './MetacogLoop.module.scss';

interface Phase {
  number: string;
  titleHe: string;
  englishHe: string;
  bodyHe: string;
  questionHe: string;
}

const PHASES: Phase[] = [
  {
    number: '01',
    titleHe: 'תכנון',
    englishHe: 'Plan',
    bodyHe: 'לפני המשימה. מה אני יודע? מה אני לא יודע? מה האסטרטגיה שלי?',
    questionHe: '"איך אני ניגש לזה?"',
  },
  {
    number: '02',
    titleHe: 'ניטור',
    englishHe: 'Monitor',
    bodyHe: 'תוך כדי המשימה. האם אני בכיוון? האם זה הגיוני? האם עליי לעצור?',
    questionHe: '"רגע — האם זה באמת מה ש...?"',
  },
  {
    number: '03',
    titleHe: 'הערכה',
    englishHe: 'Evaluate',
    bodyHe: 'אחרי המשימה. מה עבד? מה לא? מה הייתי עושה אחרת? מה אני יודע עכשיו שלא ידעתי?',
    questionHe: '"מה למדתי, באמת?"',
  },
];

const MetacogLoop: React.FC = () => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>הלולאה שמתחת לכל הכלים</span>
    <h2 className={styles.title}>שלושה שלבים. אותם שלושה — כל פעם.</h2>

    <ol className={styles.flow}>
      {PHASES.map((p, i) => (
        <li key={p.number} className={styles.phase}>
          <div className={styles.phaseHead}>
            <span className={styles.num}>{p.number}</span>
            <div>
              <h3 className={styles.phaseTitle}>{p.titleHe}</h3>
              <span className={styles.phaseEn}>{p.englishHe}</span>
            </div>
          </div>
          <p className={styles.phaseBody}>{p.bodyHe}</p>
          <p className={styles.phaseQuestion}>{p.questionHe}</p>
          {i < PHASES.length - 1 && <span className={styles.arrow} aria-hidden>←</span>}
        </li>
      ))}
    </ol>

    <p className={styles.coda}>
      <strong>KWL = תכנון.</strong> <strong>חשיבה רועשת = ניטור (גלוי).</strong>{' '}
      <strong>כרטיסי יציאה = הערכה.</strong> אותה לולאה, רק במקומות שונים בשיעור.
    </p>
  </section>
);

export default MetacogLoop;
'@
Write-Source -Path 'src/sections/03-frameworks/index.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// Section 03 — ארבעה כלים (15 min)
// Overview of 4 classic metacognitive tools + the underlying loop.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import FourTools from './FourTools';
import MetacogLoop from './MetacogLoop';

const FrameworksSection: React.FC = () => (
  <SectionShell id="frameworks">
    <FourTools />
    <MetacogLoop />
  </SectionShell>
);

export default FrameworksSection;
'@
Write-Source -Path 'src/sections/04-break/ClassPicker.module.scss' -Body @'
.form {
  @include flex-col;
  gap: $space-5;
  padding: $space-6;
  background: $bg-surface;
  border: $border-hair;
  border-radius: $radius-md;
}

.head { @include flex-col; gap: $space-2; }

.eyebrow { @include eyebrow; }
.title   { @include headline-subsection; font-weight: $weight-regular; }

.fields {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: $space-4 $space-5;

  @media (max-width: $bp-md) {
    grid-template-columns: 1fr;
  }
}

.field { @include flex-col; gap: $space-1; }
.fieldWide { grid-column: 1 / -1; }

.label {
  @include eyebrow;
  text-transform: none;
  letter-spacing: 0.02em;
  font-size: $text-xs;
  color: $ink-mid;

  em {
    color: $accent;
    font-style: normal;
    font-weight: $weight-medium;
  }
}

.optional {
  color: $ink-faint;
  font-size: 10px;
  font-weight: $weight-light;
}

.input    { @include field-base; }
.textarea { @include field-base; resize: vertical; line-height: $leading-loose; }

.tiers {
  display: flex;
  gap: $space-2;
  flex-wrap: wrap;
  margin-top: $space-1;
}

.tier {
  @include focus-ring;
  padding: 8px 14px;
  background: transparent;
  border: 1px solid $line-strong;
  border-radius: $radius-pill;
  font-family: $font-body;
  font-size: $text-sm;
  color: $ink-mid;
  cursor: pointer;
  transition: all $dur-fast $ease-out;

  &:hover { border-color: $ink; color: $ink; }
}

.tierActive {
  background: $ink !important;
  border-color: $ink !important;
  color: $bg-canvas !important;
}
'@
Write-Source -Path 'src/sections/04-break/ClassPicker.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// ClassPicker — capture teacher's class context for the personal lesson
// in §7. Persists via parent (useModuleProgress).
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import type { CustomTopic, AgeTier } from '@/types/module.types';
import styles from './ClassPicker.module.scss';

interface Props {
  value:    CustomTopic | null;
  onChange: (t: CustomTopic) => void;
}

const TIERS: { id: AgeTier; labelHe: string }[] = [
  { id: 'elementary', labelHe: 'יסודי · א-ו' },
  { id: 'middle',     labelHe: 'חט"ב · ז-ט' },
  { id: 'high',       labelHe: 'חט"ע · י-יב' },
];

const ClassPicker: React.FC<Props> = ({ value, onChange }) => {
  const v: CustomTopic = value ?? {
    subject: '', grade: '', ageTier: 'middle', topic: '', context: '',
  };

  const update = (patch: Partial<CustomTopic>) => onChange({ ...v, ...patch });

  return (
    <section className={styles.form}>
      <header className={styles.head}>
        <span className={styles.eyebrow}>איזה כיתה ואיזה נושא</span>
        <h2 className={styles.title}>על מה תעבדו בחלק האחרון?</h2>
      </header>

      <div className={styles.fields}>
        <label className={styles.field}>
          <span className={styles.label}>מקצוע <em>*</em></span>
          <input
            type="text"
            className={styles.input}
            value={v.subject}
            onChange={e => update({ subject: e.target.value })}
            placeholder="מתמטיקה, היסטוריה, תנ״ך..."
          />
        </label>

        <label className={styles.field}>
          <span className={styles.label}>שכבה <em>*</em></span>
          <input
            type="text"
            className={styles.input}
            value={v.grade}
            onChange={e => update({ grade: e.target.value })}
            placeholder="ה, ז, י..."
          />
        </label>

        <div className={[styles.field, styles.fieldWide].join(' ')}>
          <span className={styles.label}>שכבת גיל</span>
          <div className={styles.tiers}>
            {TIERS.map(t => (
              <button
                key={t.id}
                type="button"
                className={[styles.tier, v.ageTier === t.id && styles.tierActive].filter(Boolean).join(' ')}
                onClick={() => update({ ageTier: t.id })}
              >
                {t.labelHe}
              </button>
            ))}
          </div>
        </div>

        <label className={[styles.field, styles.fieldWide].join(' ')}>
          <span className={styles.label}>נושא ספציפי <em>*</em></span>
          <input
            type="text"
            className={styles.input}
            value={v.topic}
            onChange={e => update({ topic: e.target.value })}
            placeholder="מחזור המים, מלחמת ששת הימים, דמוקרטיה..."
          />
        </label>

        <label className={[styles.field, styles.fieldWide].join(' ')}>
          <span className={styles.label}>הקשר נוסף <span className={styles.optional}>(לא חובה)</span></span>
          <textarea
            className={styles.textarea}
            rows={3}
            value={v.context ?? ''}
            onChange={e => update({ context: e.target.value })}
            placeholder="הכיתה ערה, התלמידים שונאים את הנושא, פער ידע גדול בכיתה..."
          />
        </label>
      </div>
    </section>
  );
};

export default ClassPicker;
'@
Write-Source -Path 'src/sections/04-break/index.module.scss' -Body @'
.breakBanner {
  @include flex-col;
  gap: $space-3;
  padding: $space-7 $space-5;
  background: $bg-subtle;
  border-radius: $radius-md;
  text-align: center;
}

.eyebrow { @include eyebrow; color: $accent; }

.bannerTitle {
  @include headline-section;
  font-weight: $weight-light;
}

.bannerBody {
  @include body-paragraph;
  max-width: $content-narrow;
  margin: 0 auto;
}

.gateHint {
  @include body-paragraph;
  font-size: $text-sm;
  color: $ink-soft;
  font-style: italic;
  text-align: center;
  margin-top: $space-3;
}
'@
Write-Source -Path 'src/sections/04-break/index.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// Section 04 — הפסקה + בחירת הכיתה (15 min)
// ═══════════════════════════════════════════════════════════════════
import React, { useState } from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import { useProgressCtx } from '@/components/ModuleShell/ModuleProgressContext';
import type { CustomTopic } from '@/types/module.types';
import ClassPicker from './ClassPicker';
import styles from './index.module.scss';

const BreakSection: React.FC = () => {
  const { progress, setCustomTopic } = useProgressCtx();
  const [topic, setTopic] = useState<CustomTopic | null>(progress.customTopic);

  const isValid = !!topic
    && topic.subject.trim() !== ''
    && topic.grade.trim() !== ''
    && topic.topic.trim() !== '';

  const handleChange = (next: CustomTopic) => {
    setTopic(next);
    setCustomTopic(next);
  };

  return (
    <SectionShell id="break" canAdvance={isValid}>
      <section className={styles.breakBanner}>
        <span className={styles.eyebrow}>הפסקה</span>
        <h2 className={styles.bannerTitle}>קחו 10 דקות.</h2>
        <p className={styles.bannerBody}>
          אוויר. מים. ארוחה קלה. כשתחזרו — נמלא יחד את הטופס למטה. הוא יקבע
          על איזו יחידה ועל איזו כיתה תעבדו בחלק האחרון.
        </p>
      </section>

      <ClassPicker value={topic} onChange={handleChange} />

      {!isValid && (
        <p className={styles.gateHint}>
          ⌗ אי אפשר להתקדם בלי למלא את הטופס. שלושה שדות חובה: מקצוע, שכבה, ונושא.
        </p>
      )}
    </SectionShell>
  );
};

export default BreakSection;
'@
Write-Source -Path 'src/sections/05-ai/AIReframe.module.scss' -Body @'
.section { @include flex-col; gap: $space-5; }

.head { @include flex-col; gap: $space-3; }
.eyebrow { @include eyebrow; }

.title {
  @include headline-section;
  font-weight: $weight-light;

  em {
    @include accent-underline;
    font-style: normal;
  }
}

.lede {
  @include lede;
  max-width: $content-narrow;

  em { color: $ink; font-style: italic; }
}

.split {
  display: grid;
  grid-template-columns: 1fr 1px 1fr;
  gap: $space-6;
  padding: $space-5 0;

  @media (max-width: $bp-md) {
    grid-template-columns: 1fr;
    gap: $space-5;
  }
}

.col { @include flex-col; gap: $space-3; }

.colTag { @include eyebrow; color: $ink-soft; }
.colTagAccent { color: $accent; }

.list {
  list-style: none;
  margin: 0;
  padding: 0;
  @include flex-col;
  gap: $space-2;

  li {
    @include body-paragraph;
    padding: 6px 0;
    border-bottom: $border-subtle;

    &:last-child { border-bottom: none; }
  }
}

.colCoda {
  @include body-paragraph;
  font-size: $text-sm;
  margin-top: $space-3;
  padding-top: $space-3;
  border-top: $border-subtle;
  color: $ink;
  font-style: italic;

  strong {
    font-weight: $weight-medium;
    color: $accent-deep;
    font-style: normal;
  }

  em {
    font-style: italic;
    color: $accent;
  }
}

.divider {
  background: $line;
  width: 1px;

  @media (max-width: $bp-md) { display: none; }
}
'@
Write-Source -Path 'src/sections/05-ai/AIReframe.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// AIReframe — metacognition-specific framing:
// AI doesn't think FOR the student. It makes the thinking visible.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './AIReframe.module.scss';

const CANNOT = [
  'איך התלמיד שלך באמת ניגש לבעיה (רק הוא יודע)',
  'איפה התקיעות שלו הסתירה — שעמום, חרדה, פער ידע',
  'מה הוא חושב שהוא יודע, אבל לא',
  'את הקצב הספציפי של הכיתה שלך, את האנרגיה של חמישי-אחרי-טסטים',
  'את ההבדל בין "שתק כי הבין" לבין "שתק כי איבד אותך"',
];

const CAN = [
  'לייצר מבני KWL מותאמים לנושא ולגיל — בדקה',
  'להפיק תסריטי "חשיבה רועשת" שמדגימים תהליך, לא רק תוצאה',
  'להציע 5 וריאציות של כרטיס יציאה — כל אחת חושפת ממד אחר',
  'להעלות תפיסות שגויות שאפילו מורים מנוסים מפספסים',
  'לכתוב סקריפט שאלות-עצמיות לתלמיד שתקוע',
];

const AIReframe: React.FC = () => (
  <section className={styles.section}>
    <header className={styles.head}>
      <span className={styles.eyebrow}>עכשיו AI נכנס</span>
      <h2 className={styles.title}>
        הוא לא חושב <em>במקום</em> התלמיד. הוא עוזר לכם לעשות את החשיבה <em>נראית</em>.
      </h2>
      <p className={styles.lede}>
        בארבעת החלקים הקודמים תרגלתם מטא-קוגניציה — לבד. עכשיו נראה איך כלי
        אחד יכול להפוך אותה למהירה ושיטתית בכיתה. לפני שמתחילים, חשוב להיות
        ברור: מה הוא <em>לא</em> ידע, ומה הוא <em>כן</em>.
      </p>
    </header>

    <div className={styles.split}>
      <div className={styles.col}>
        <span className={styles.colTag}>AI לא ידע</span>
        <ul className={styles.list}>
          {CANNOT.map((t, i) => <li key={i}>{t}</li>)}
        </ul>
        <p className={styles.colCoda}>
          לכן <strong>אתם</strong> מפענחים את הכרטיס שחזר. AI מייצר את הכלי —
          הקריאה בו, היא שלכם.
        </p>
      </div>

      <div className={styles.divider} aria-hidden />

      <div className={styles.col}>
        <span className={[styles.colTag, styles.colTagAccent].join(' ')}>AI יעזור עם</span>
        <ul className={styles.list}>
          {CAN.map((t, i) => <li key={i}>{t}</li>)}
        </ul>
        <p className={styles.colCoda}>
          <strong>הצוואר הצר של מטא-קוגניציה בכיתה</strong> הוא לא הכלים — הם
          מוכרים. הוא <em>זמן להכנה</em>. בדיוק שם AI עוזר.
        </p>
      </div>
    </div>
  </section>
);

export default AIReframe;
'@
Write-Source -Path 'src/sections/05-ai/PromptCardDeck.module.scss' -Body @'
.section { @include flex-col; gap: $space-5; }

.head    { @include flex-col; gap: $space-3; }
.eyebrow { @include eyebrow; }
.title   { @include headline-section; font-weight: $weight-light; }

.lede {
  @include lede;
  max-width: $content-narrow;
}

.deck {
  list-style: none;
  margin: 0;
  padding: 0;
  @include flex-col;
  gap: $space-3;
}

.deckItem {
  display: grid;
  grid-template-columns: 40px 1fr;
  gap: $space-4;
  padding: $space-4 0;
  border-bottom: $border-subtle;

  &:last-child { border-bottom: none; }
}

.deckNum {
  font-family: $font-mono;
  font-size: $text-base;
  font-weight: $weight-regular;
  color: $accent;
  letter-spacing: 0.02em;
}

.deckBody { @include flex-col; gap: $space-1; min-width: 0; }

.deckName {
  font-family: $font-display;
  font-size: $text-md;
  font-weight: $weight-medium;
  color: $ink;
  line-height: $leading-tight;
}

.deckTag {
  @include body-paragraph;
  font-size: $text-sm;
  color: $ink;
  font-style: italic;
}

.deckWhen {
  @include body-paragraph;
  font-size: $text-sm;
  color: $ink-soft;
  margin-top: $space-1;
}

.full {
  @include flex-col;
  gap: $space-3;
  margin-top: $space-4;
  padding-top: $space-5;
  border-top: $border-subtle;
}

.fullEyebrow {
  @include eyebrow;
  color: $accent;
}

.bridge {
  @include body-paragraph;
  font-style: italic;
  margin-top: $space-3;
  padding: $space-4 0;
  border-top: $border-subtle;
}
'@
Write-Source -Path 'src/sections/05-ai/PromptCardDeck.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// PromptCardDeck — overview of 5 prompt cards + the KWL card (first
// of the three featured methods) shown in full.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import { PROMPT_CARDS, PROMPT_CARD_BY_ID } from '@/data/promptCards';
import PromptCard from '@/components/PromptCard/PromptCard';
import styles from './PromptCardDeck.module.scss';

const PromptCardDeck: React.FC = () => {
  const kwl = PROMPT_CARD_BY_ID['kwl'];

  return (
    <section className={styles.section}>
      <header className={styles.head}>
        <span className={styles.eyebrow}>הקיט · חמש כרטיסיות</span>
        <h2 className={styles.title}>חמש כרטיסיות פרומפט — מהירות, מטא-קוגניטיביות.</h2>
        <p className={styles.lede}>
          לכל כרטיסייה — רגע בכיתה. שלוש מהן יקבלו הדגמה מלאה בחלק הבא. לראשונה
          — נצלול לתוכה עכשיו.
        </p>
      </header>

      <ul className={styles.deck}>
        {PROMPT_CARDS.map(c => (
          <li key={c.id} className={styles.deckItem}>
            <span className={styles.deckNum}>{c.number}</span>
            <div className={styles.deckBody}>
              <h3 className={styles.deckName}>{c.nameHe}</h3>
              <p className={styles.deckTag}>{c.taglineHe}</p>
              <p className={styles.deckWhen}>{c.whenToUseHe}</p>
            </div>
          </li>
        ))}
      </ul>

      <div className={styles.full}>
        <span className={styles.fullEyebrow}>כרטיסייה 01 · במלואה</span>
        <PromptCard
          prompt={{
            roleHe: kwl.roleHe,
            contextHe: kwl.contextHe,
            taskHe: kwl.taskHe,
            constraintsHe: kwl.constraintsHe,
          }}
          nameHe={kwl.nameHe}
          exampleHe={kwl.exampleHe}
        />
      </div>

      <p className={styles.bridge}>
        בחלק הבא — שלוש כרטיסיות (KWL, חשיבה רועשת, כרטיסי יציאה) על אתגרים
        כיתתיים אמיתיים, עם פלט מ-AI ושיעור שלם שיצא מזה.
      </p>
    </section>
  );
};

export default PromptCardDeck;
'@
Write-Source -Path 'src/sections/05-ai/index.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// Section 05 — AI כתשתית חשיבה (25 min)
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import AIReframe from './AIReframe';
import PromptCardDeck from './PromptCardDeck';

const AISection: React.FC = () => (
  <SectionShell id="ai">
    <AIReframe />
    <PromptCardDeck />
  </SectionShell>
);

export default AISection;
'@
Write-Source -Path 'src/sections/06-methods/MethodDemo.module.scss' -Body @'
.demo {
  @include flex-col;
  gap: $space-5;
  padding: $space-6;
  background: $bg-surface;
  border: $border-hair;
  border-radius: $radius-md;
}

.head {
  display: grid;
  grid-template-columns: 56px 1fr;
  gap: $space-4;
  align-items: baseline;
  padding-bottom: $space-4;
  border-bottom: $border-subtle;
}

.num {
  font-family: $font-display;
  font-size: $text-3xl;
  font-weight: $weight-light;
  color: $accent;
  line-height: 0.9;
  letter-spacing: -0.02em;
}

.headBody { @include flex-col; gap: $space-1; min-width: 0; }

.name {
  font-family: $font-display;
  font-size: $text-xl;
  font-weight: $weight-regular;
  color: $ink;
}

.tagline {
  @include body-paragraph;
  font-size: $text-sm;
  color: $ink-mid;
  font-style: italic;
}

.whenBox {
  @include flex-col;
  gap: $space-1;
  padding: $space-3 $space-4;
  background: $accent-faint;
  border-radius: $radius-sm;
}

.whenLabel { @include eyebrow; color: $accent; }
.whenBody  { @include body-paragraph; font-size: $text-sm; }

.beat { @include flex-col; gap: $space-3; }

.beatTag { @include eyebrow; color: $ink-soft; }

.challenge {
  @include body-paragraph;
  font-family: $font-display;
  font-weight: $weight-light;
  font-size: $text-md;
  color: $ink;
  font-style: italic;
  padding-inline-start: $space-4;
  border-inline-start: 2px solid $accent;
}

.context {
  font-family: $font-mono;
  font-size: 11px;
  color: $ink-soft;
  letter-spacing: 0.04em;
}

.outputs {
  list-style: none;
  margin: 0;
  padding: 0;
  @include flex-col;
  gap: $space-3;
}

.output {
  display: grid;
  grid-template-columns: 140px 1fr;
  gap: $space-4;
  padding: $space-3 0;
  border-bottom: $border-subtle;

  &:last-child { border-bottom: none; }

  @media (max-width: $bp-md) {
    grid-template-columns: 1fr;
    gap: $space-1;
  }
}

.outputLabel {
  font-family: $font-mono;
  font-size: $text-xs;
  font-weight: $weight-medium;
  color: $accent;
  letter-spacing: 0.02em;
  padding-top: 4px;
}

.outputValue {
  @include body-paragraph;
  font-size: $text-sm;
}

.reflection {
  @include flex-col;
  gap: $space-2;
  padding: $space-4 $space-5;
  background: $bg-subtle;
  border-radius: $radius-sm;
  border-inline-start: 2px solid $ink-faint;

  p {
    @include body-paragraph;
    font-size: $text-sm;
    color: $ink;
    font-style: italic;
  }
}

.reflectionLabel { @include eyebrow; color: $ink-soft; }
'@
Write-Source -Path 'src/sections/06-methods/MethodDemo.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// MethodDemo — renders one complete method demonstration:
//   - Method name + when-to-use
//   - The challenge that prompted it
//   - The 4-part prompt
//   - The AI output rows
//   - The lesson plan
//   - The teacher's reflection
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import type { MethodDemo as MethodDemoData } from '@/data/methods';
import PromptCard from '@/components/PromptCard/PromptCard';
import LessonPlanCard from '@/components/LessonPlanCard/LessonPlanCard';
import styles from './MethodDemo.module.scss';

interface Props {
  demo:  MethodDemoData;
  index: number;
}

const MethodDemo: React.FC<Props> = ({ demo, index }) => (
  <article className={styles.demo}>
    <header className={styles.head}>
      <span className={styles.num}>0{index}</span>
      <div className={styles.headBody}>
        <h2 className={styles.name}>{demo.nameHe}</h2>
        <p className={styles.tagline}>{demo.taglineHe}</p>
      </div>
    </header>

    <div className={styles.whenBox}>
      <span className={styles.whenLabel}>מתי להשתמש</span>
      <p className={styles.whenBody}>{demo.whenToUseHe}</p>
    </div>

    <section className={styles.beat}>
      <span className={styles.beatTag}>האתגר שלי</span>
      <p className={styles.challenge}>{demo.challengeHe}</p>
      <span className={styles.context}>{demo.gradeHe} · {demo.subjectHe}</span>
    </section>

    <section className={styles.beat}>
      <span className={styles.beatTag}>הפרומפט ששלחתי</span>
      <PromptCard prompt={demo.prompt} />
    </section>

    <section className={styles.beat}>
      <span className={styles.beatTag}>מה ש-AI החזיר</span>
      <ul className={styles.outputs}>
        {demo.outputs.map((o, i) => (
          <li key={i} className={styles.output}>
            <span className={styles.outputLabel}>{o.labelHe}</span>
            <p className={styles.outputValue}>{o.valueHe}</p>
          </li>
        ))}
      </ul>
    </section>

    <section className={styles.beat}>
      <span className={styles.beatTag}>השיעור שיצא</span>
      <LessonPlanCard
        titleHe={`${demo.nameHe} · ${demo.subjectHe}`}
        blocks={demo.lesson}
        classHe={demo.gradeHe}
      />
    </section>

    <aside className={styles.reflection}>
      <span className={styles.reflectionLabel}>הרהור אחרי</span>
      <p>{demo.reflectionHe}</p>
    </aside>
  </article>
);

export default MethodDemo;
'@
Write-Source -Path 'src/sections/06-methods/MethodsIntro.module.scss' -Body @'
.section { @include flex-col; gap: $space-3; }

.eyebrow { @include eyebrow; }
.title   { @include headline-section; font-weight: $weight-light; }

.lede {
  @include lede;
  max-width: $content-narrow;

  em {
    @include accent-underline;
    font-style: normal;
  }
}

.previewList {
  list-style: none;
  margin: $space-3 0 0;
  padding: 0;
  @include flex-col;
  gap: $space-2;

  li {
    @include body-paragraph;
    padding: $space-2 0;
    border-bottom: $border-subtle;

    strong { font-weight: $weight-medium; color: $ink; }

    &:last-child { border-bottom: none; }
  }
}
'@
Write-Source -Path 'src/sections/06-methods/MethodsIntro.tsx' -Body @'
import React from 'react';
import styles from './MethodsIntro.module.scss';

const MethodsIntro: React.FC = () => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>שלוש שיטות מתורגלות</span>
    <h2 className={styles.title}>שלוש שיטות — שלושת השלבים של הלולאה.</h2>
    <p className={styles.lede}>
      בחרנו שיטה לכל שלב של הלולאה המטא-קוגניטיבית. KWL = <em>תכנון</em>.
      חשיבה רועשת = <em>ניטור גלוי</em>. כרטיסי יציאה = <em>הערכה</em>. ככה
      בסוף ההשתלמות יש לכם כיסוי לכל שיעור — מההתחלה ועד הסוף.
    </p>
    <ul className={styles.previewList}>
      <li><strong>KWL</strong> · לפתיחת יחידה. מוציא ידע מוקדם ותפיסות שגויות.</li>
      <li><strong>חשיבה רועשת</strong> · לאמצע. מדגים תהליך לכיתה שיודעת תשובה אך לא דרך.</li>
      <li><strong>כרטיסי יציאה</strong> · לסוף שיעור. תמונת מצב — לא ציון.</li>
    </ul>
  </section>
);

export default MethodsIntro;
'@
Write-Source -Path 'src/sections/06-methods/index.module.scss' -Body @'
.demos {
  @include flex-col;
  gap: $space-8;
}
'@
Write-Source -Path 'src/sections/06-methods/index.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// Section 06 — שלוש שיטות (35 min)
// KWL · Think-Aloud · Exit tickets.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import { ALL_DEMOS } from '@/data/methods';
import MethodsIntro from './MethodsIntro';
import MethodDemo from './MethodDemo';
import styles from './index.module.scss';

const MethodsSection: React.FC = () => (
  <SectionShell id="methods">
    <MethodsIntro />
    <div className={styles.demos}>
      {ALL_DEMOS.map((demo, i) => (
        <MethodDemo key={demo.id} demo={demo} index={i + 1} />
      ))}
    </div>
  </SectionShell>
);

export default MethodsSection;
'@
Write-Source -Path 'src/sections/07-personal/MethodSelector.module.scss' -Body @'
.section { @include flex-col; gap: $space-3; }

.eyebrow { @include eyebrow; }

.grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: $space-3;

  @media (max-width: $bp-md) {
    grid-template-columns: 1fr;
  }
}

.card {
  @include focus-ring;
  @include flex-col;
  gap: $space-2;
  padding: $space-4 $space-5;
  background: $bg-surface;
  border: $border-hair;
  border-radius: $radius-md;
  text-align: start;
  cursor: pointer;
  transition: all $dur-fast $ease-out;

  &:hover { border-color: $ink-mid; }
}

.cardActive {
  background: $ink !important;
  border-color: $ink !important;

  .name    { color: $bg-canvas; }
  .tagline { color: rgba(245, 246, 248, 0.85); }
  .when    { color: rgba(245, 246, 248, 0.65); }
}

.name {
  font-family: $font-display;
  font-size: $text-md;
  font-weight: $weight-medium;
  color: $ink;
}

.tagline {
  font-family: $font-body;
  font-size: $text-sm;
  color: $ink-mid;
  font-style: italic;
}

.when {
  @include body-paragraph;
  font-size: $text-xs;
  color: $ink-soft;
  margin-top: $space-1;
}
'@
Write-Source -Path 'src/sections/07-personal/MethodSelector.tsx' -Body @'
import React from 'react';
import { ALL_DEMOS } from '@/data/methods';
import type { TechniqueKey } from '@/types/module.types';
import styles from './MethodSelector.module.scss';

interface Props {
  selected: TechniqueKey | null;
  onSelect: (t: TechniqueKey) => void;
}

const MethodSelector: React.FC<Props> = ({ selected, onSelect }) => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>שלב 1 · בחרו שיטה</span>
    <div className={styles.grid}>
      {ALL_DEMOS.map(d => {
        const isActive = selected === d.id;
        return (
          <button
            key={d.id}
            type="button"
            className={[styles.card, isActive && styles.cardActive].filter(Boolean).join(' ')}
            onClick={() => onSelect(d.id)}
            aria-pressed={isActive}
          >
            <h3 className={styles.name}>{d.nameHe}</h3>
            <p className={styles.tagline}>{d.taglineHe}</p>
            <p className={styles.when}>{d.whenToUseHe}</p>
          </button>
        );
      })}
    </div>
  </section>
);

export default MethodSelector;
'@
Write-Source -Path 'src/sections/07-personal/PersonalNotes.module.scss' -Body @'
.section { @include flex-col; gap: $space-3; }

.eyebrow { @include eyebrow; }
.title   { @include headline-subsection; font-weight: $weight-regular; }

.textarea {
  @include field-base;
  resize: vertical;
  min-height: 240px;
  line-height: $leading-loose;
  font-family: $font-body;
}

.tip {
  @include body-paragraph;
  font-size: $text-sm;
  color: $ink-soft;
  font-style: italic;
}
'@
Write-Source -Path 'src/sections/07-personal/PersonalNotes.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// PersonalNotes — scratchpad for capturing AI output + lesson notes.
// localStorage-backed.
// ═══════════════════════════════════════════════════════════════════
import React, { useEffect, useState } from 'react';
import styles from './PersonalNotes.module.scss';

const KEY = 'binai.m06.personalNotes.v1';

function load(): string {
  try { return localStorage.getItem(KEY) ?? ''; } catch { return ''; }
}
function save(value: string): void {
  try { localStorage.setItem(KEY, value); } catch { /* noop */ }
}

const PersonalNotes: React.FC = () => {
  const [text, setText] = useState<string>(() => load());

  useEffect(() => { save(text); }, [text]);

  return (
    <section className={styles.section}>
      <span className={styles.eyebrow}>שלב 3 · רושמים את השיעור שיצא</span>
      <h3 className={styles.title}>
        כאן רושמים מה AI החזיר, מה לקחתי, ומה אני באמת אעשה בכיתה.
      </h3>
      <textarea
        className={styles.textarea}
        value={text}
        onChange={e => setText(e.target.value)}
        placeholder={'מה AI החזיר:\n— ...\n\nמה אקח לשיעור:\n— ...\n\nמה אעשה אחרת מהמומלץ:\n— ...'}
        rows={12}
      />
      <p className={styles.tip}>
        הטקסט נשמר אוטומטית. בחלק הסיום תוכלו להוריד אותו כ-PDF.
      </p>
    </section>
  );
};

export default PersonalNotes;
'@
Write-Source -Path 'src/sections/07-personal/PersonalPromptBuilder.module.scss' -Body @'
.section { @include flex-col; gap: $space-3; }

.eyebrow { @include eyebrow; }

.title {
  @include headline-subsection;
  font-weight: $weight-regular;

  em {
    @include accent-underline;
    font-style: normal;
    font-weight: $weight-regular;
  }
}

.note {
  @include body-paragraph;
  font-size: $text-sm;
  color: $ink-mid;
}
'@
Write-Source -Path 'src/sections/07-personal/PersonalPromptBuilder.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// PersonalPromptBuilder — composes a 4-part prompt for the teacher's
// own class using the selected method's template, substituting their
// subject/grade/topic/context.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import PromptCard from '@/components/PromptCard/PromptCard';
import { DEMO_BY_ID } from '@/data/methods';
import type { TechniqueKey, CustomTopic } from '@/types/module.types';
import styles from './PersonalPromptBuilder.module.scss';

interface Props {
  technique: TechniqueKey;
  topic:     CustomTopic;
}

function buildPrompt(tech: TechniqueKey, t: CustomTopic) {
  const demo = DEMO_BY_ID[tech];
  const ctx = t.context ? ` ${t.context}` : '';

  if (tech === 'kwl') {
    return {
      ...demo.prompt,
      contextHe: `אני מתחיל/ה יחידה בנושא "${t.topic}" ב${t.subject}, כיתה ${t.grade}. שיעור פתיחה — 45 דקות.${ctx}`,
      taskHe: `בני/ה לי טופס KWL מותאם — שלוש עמודות. ב-K: 5 שאלות שמוציאות ידע מוקדם. ב-W: 5 שאלות מעוררות סקרנות. ב-L: 3 שאלות סיכום ליחידה. הוסיפ/י 5 תפיסות שגויות נפוצות שצפויות לעלות ב-K — כדי שאדע מראש מה לחפש.`,
    };
  }

  if (tech === 'thinkaloud') {
    return {
      ...demo.prompt,
      contextHe: `אני מלמד/ת ${t.subject} בכיתה ${t.grade}. סוג הבעיות שבו תלמידים נתקעים בנושא "${t.topic}": [תיאור].${ctx} דוגמה ספציפית של בעיה כזאת: [פרטו].`,
    };
  }

  // exit
  return {
    ...demo.prompt,
    contextHe: `סיימתי שיעור על "${t.topic}" ב${t.subject}, כיתה ${t.grade}.${ctx} רוצה כרטיס יציאה של 2-3 דקות, אבל לא אחד — מבחר.`,
  };
}

const PersonalPromptBuilder: React.FC<Props> = ({ technique, topic }) => {
  const demo   = DEMO_BY_ID[technique];
  const prompt = buildPrompt(technique, topic);

  return (
    <section className={styles.section}>
      <span className={styles.eyebrow}>שלב 2 · הפרומפט שלכם</span>
      <h3 className={styles.title}>
        {demo.nameHe} · עבור <em>"{topic.topic}"</em>, כיתה {topic.grade}
      </h3>
      <p className={styles.note}>
        השלימו את החלקים בסוגריים מרובעים, העתיקו, והריצו ב-AI. אם הוספתם פרטים
        על תלמיד ספציפי, התייעצו עם רכז/ת מקצוע לפני הריצה.
      </p>
      <PromptCard prompt={prompt} />
    </section>
  );
};

export default PersonalPromptBuilder;
'@
Write-Source -Path 'src/sections/07-personal/index.module.scss' -Body @'
.head    { @include flex-col; gap: $space-3; }
.eyebrow { @include eyebrow; }
.title   { @include headline-section; font-weight: $weight-light; }
.lede    { @include lede; max-width: $content-narrow; }

.warn {
  @include body-paragraph;
  padding: $space-4 $space-5;
  background: $accent-faint;
  color: $accent-deep;
  border-radius: $radius-md;
  border-inline-start: 2px solid $accent;
}
'@
Write-Source -Path 'src/sections/07-personal/index.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// Section 07 — השיעור המטא-קוגניטיבי שלכם (30 min)
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import { useProgressCtx } from '@/components/ModuleShell/ModuleProgressContext';
import MethodSelector from './MethodSelector';
import PersonalPromptBuilder from './PersonalPromptBuilder';
import PersonalNotes from './PersonalNotes';
import styles from './index.module.scss';

const PersonalSection: React.FC = () => {
  const { progress, setPersonalTechnique } = useProgressCtx();
  const tech  = progress.personalTechnique;
  const topic = progress.customTopic;

  return (
    <SectionShell id="personal">
      <header className={styles.head}>
        <span className={styles.eyebrow}>החלק שלכם · 30 דקות</span>
        <h2 className={styles.title}>השיעור המטא-קוגניטיבי שלכם — לכיתה שלכם, על הנושא שבחרתם.</h2>
        <p className={styles.lede}>
          בחרו אחת מהשלוש. הפרומפט יבנה אוטומטית סביב הנושא שלכם. העתיקו, הריצו
          במודל AI שאתם משתמשים בו, ורשמו פה מה יצא ומה אתם תעשו איתו בכיתה.
        </p>
      </header>

      {!topic && (
        <p className={styles.warn}>
          חסר נושא לכיתה שלכם. חזרו לחלק 4 (הפסקה) ומלאו את הטופס.
        </p>
      )}

      <MethodSelector
        selected={tech}
        onSelect={setPersonalTechnique}
      />

      {tech && topic && (
        <>
          <PersonalPromptBuilder technique={tech} topic={topic} />
          <PersonalNotes />
        </>
      )}
    </SectionShell>
  );
};

export default PersonalSection;
'@
Write-Source -Path 'src/sections/08-closing/ClosingHero.module.scss' -Body @'
.section { @include flex-col; gap: $space-3; }

.eyebrow { @include eyebrow; }
.title   { @include headline-section; font-weight: $weight-light; }

.lede {
  @include lede;
  max-width: $content-narrow;

  em {
    @include accent-underline;
    font-style: normal;
  }
}

.stats {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: $space-3;
  margin: $space-4 0 0;
  padding: $space-5 0;
  border-top: $border-subtle;
  border-bottom: $border-subtle;

  @media (max-width: $bp-md) {
    grid-template-columns: 1fr;
    gap: $space-4;
  }
}

.stat {
  @include flex-col;
  gap: $space-1;
  align-items: start;
}

.statValue {
  font-family: $font-display;
  font-size: $text-4xl;
  font-weight: $weight-light;
  color: $accent;
  line-height: 1;
  letter-spacing: -0.02em;
}

.statLabel {
  @include eyebrow;
  color: $ink-soft;
}
'@
Write-Source -Path 'src/sections/08-closing/ClosingHero.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// ClosingHero — opens Section 8 with summary of what was built.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import styles from './ClosingHero.module.scss';

const STATS = [
  { value: '4', labelHe: 'שיעורים מוכנים' },
  { value: '5', labelHe: 'כרטיסיות פרומפט' },
  { value: '3', labelHe: 'שיטות מטא-קוגניציה' },
];

const ClosingHero: React.FC = () => (
  <section className={styles.section}>
    <span className={styles.eyebrow}>סיכום</span>
    <h2 className={styles.title}>בשעתיים וחצי האחרונות בניתם תשתית, לא רק שיעור.</h2>
    <p className={styles.lede}>
      תרגלתם מטא-קוגניציה על עצמכם. ראיתם איך הפער בין תוצר לבין חשיבה הוא
      ההוראה האמיתית. בניתם שיעור על נושא אמיתי בכיתה אמיתית. <em>שלוש
      השיטות שיצאו לכם הביתה</em> — מכסות את הלולאה המטא-קוגניטיבית מההתחלה
      של היחידה ועד הסוף של שיעור בודד.
    </p>

    <dl className={styles.stats}>
      {STATS.map(s => (
        <div key={s.labelHe} className={styles.stat}>
          <dt className={styles.statValue}>{s.value}</dt>
          <dd className={styles.statLabel}>{s.labelHe}</dd>
        </div>
      ))}
    </dl>
  </section>
);

export default ClosingHero;
'@
Write-Source -Path 'src/sections/08-closing/LessonPDFSet.module.scss' -Body @'
.section {
  @include flex-col;
  gap: $space-3;
  margin-top: $space-5;
}

.eyebrow { @include eyebrow; }
.title   { @include headline-section; font-weight: $weight-light; }

.note {
  @include body-paragraph;
  font-size: $text-sm;

  strong { font-weight: $weight-medium; color: $ink; }
}

.grid {
  list-style: none;
  margin: $space-3 0 0;
  padding: 0;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: $space-3;

  @media (max-width: $bp-md) {
    grid-template-columns: 1fr;
  }
}

.card {
  @include flex-col;
  gap: $space-2;
  padding: $space-4 $space-5;
  background: $bg-surface;
  border: $border-hair;
  border-radius: $radius-md;
}

.cardTitle {
  font-family: $font-display;
  font-size: $text-md;
  font-weight: $weight-medium;
  color: $ink;
}

.cardMeta {
  font-family: $font-mono;
  font-size: 11px;
  color: $ink-soft;
  letter-spacing: 0.04em;
}

.btn {
  @include btn-secondary;
  align-self: start;
  margin-top: $space-2;
  display: inline-flex;
  align-items: center;
  gap: $space-2;

  svg { font-size: 14px; }
}

.cardEmpty {
  background: $bg-subtle;
  border-style: dashed;
}

.cardTitleEmpty {
  font-family: $font-display;
  font-size: $text-md;
  font-weight: $weight-regular;
  color: $ink-soft;
}

.cardMetaEmpty {
  @include body-paragraph;
  font-size: $text-sm;
  color: $ink-soft;
  font-style: italic;
}

// ── PRINT PAGE ─────────────────────────────────────────────────
.printPage {
  font-family: $font-body;
  color: $ink;
  padding: 16mm 14mm;
  background: white;
}

.printHeader {
  display: flex;
  flex-direction: column;
  gap: 6pt;
  margin-bottom: 18pt;
  padding-bottom: 10pt;
  border-bottom: 1pt solid $line-strong;
}

.printTag {
  font-family: $font-mono;
  font-size: 9pt;
  color: $accent;
  text-transform: uppercase;
  letter-spacing: 0.08em;
}

.printTitle {
  font-family: $font-display;
  font-size: 22pt;
  font-weight: 400;
  color: $ink;
  line-height: 1.2;
}

.printMeta {
  font-family: $font-mono;
  font-size: 9pt;
  color: $ink-soft;
  letter-spacing: 0.04em;
}

.printNotes {
  margin-top: 18pt;
  padding-top: 12pt;
  border-top: 1pt solid $line-strong;
}

.printNotesTitle {
  font-family: $font-display;
  font-size: 13pt;
  font-weight: 500;
  color: $ink;
  margin-bottom: 8pt;
}

.printNotesBody {
  font-family: $font-body;
  font-size: 10pt;
  line-height: 1.7;
  color: $ink-mid;
  white-space: pre-wrap;
  word-break: break-word;
}

.printFooter {
  margin-top: 24pt;
  padding-top: 8pt;
  border-top: 1pt solid $line;
  font-family: $font-mono;
  font-size: 8pt;
  color: $ink-faint;
  letter-spacing: 0.04em;
  text-align: center;
}
'@
Write-Source -Path 'src/sections/08-closing/LessonPDFSet.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// LessonPDFSet — 4 printable lesson plans:
//   - 3 demo lessons (KWL · Think-Aloud · Exit tickets)
//   - 1 personal lesson (built from teacher's customTopic + technique
//     + personalNotes textarea contents)
//
// Print isolation via React portal mounted to document.body with
// class "m06-print-host". global.scss hides #root during print and
// shows only the portal content.
// ═══════════════════════════════════════════════════════════════════
import React, { useEffect, useMemo, useState } from 'react';
import { createPortal } from 'react-dom';
import { TbDownload } from 'react-icons/tb';
import LessonPlanCard from '@/components/LessonPlanCard/LessonPlanCard';
import { useProgressCtx } from '@/components/ModuleShell/ModuleProgressContext';
import { ALL_DEMOS, DEMO_BY_ID } from '@/data/methods';
import type { LessonBlock } from '@/data/methods';
import styles from './LessonPDFSet.module.scss';

const NOTES_KEY = 'binai.m06.personalNotes.v1';

interface PrintLesson {
  id:       string;
  titleHe:  string;
  classHe?: string;
  topicHe?: string;
  blocks:   LessonBlock[];
  notesHe?: string;
}

function loadNotes(): string {
  try { return localStorage.getItem(NOTES_KEY) ?? ''; } catch { return ''; }
}

const LessonPDFSet: React.FC = () => {
  const { progress } = useProgressCtx();
  const [printing, setPrinting] = useState<string | null>(null);
  const [host, setHost] = useState<HTMLElement | null>(null);

  useEffect(() => {
    let el = document.querySelector<HTMLElement>('.m06-print-host');
    if (!el) {
      el = document.createElement('div');
      el.className = 'm06-print-host';
      document.body.appendChild(el);
    }
    setHost(el);
  }, []);

  const lessons: PrintLesson[] = useMemo(() => {
    const list: PrintLesson[] = ALL_DEMOS.map(d => ({
      id:      `demo-${d.id}`,
      titleHe: `${d.nameHe} · ${d.subjectHe}`,
      classHe: d.gradeHe,
      topicHe: d.challengeHe.split('.')[0],
      blocks:  d.lesson,
    }));

    if (progress.customTopic && progress.personalTechnique) {
      const demo = DEMO_BY_ID[progress.personalTechnique];
      const notes = loadNotes();
      list.push({
        id:      'personal',
        titleHe: `השיעור שלי · ${demo.nameHe}`,
        classHe: `${progress.customTopic.subject} · כיתה ${progress.customTopic.grade}`,
        topicHe: progress.customTopic.topic,
        blocks:  demo.lesson,
        notesHe: notes,
      });
    }
    return list;
  }, [progress.customTopic, progress.personalTechnique]);

  const handlePrint = (id: string) => {
    setPrinting(id);
    requestAnimationFrame(() => {
      window.print();
      setTimeout(() => setPrinting(null), 200);
    });
  };

  const currentLesson = lessons.find(l => l.id === printing);

  return (
    <section className={styles.section}>
      <span className={styles.eyebrow}>הקיט · {lessons.length} שיעורים</span>
      <h2 className={styles.title}>שיעורים מוכנים — להוריד כ-PDF.</h2>
      <p className={styles.note}>
        כל לחיצה פותחת תיבת הדפסה של הדפדפן. <strong>בחרו "שמור כ-PDF"</strong>
        כיעד. ההדפסה מבודדת — רק השיעור הנבחר ייצא, לא הממשק.
      </p>

      <ul className={styles.grid}>
        {lessons.map(l => (
          <li key={l.id} className={styles.card}>
            <h3 className={styles.cardTitle}>{l.titleHe}</h3>
            <p className={styles.cardMeta}>
              {l.classHe}{l.topicHe ? ` · ${l.topicHe}` : ''}
            </p>
            <button
              type="button"
              className={styles.btn}
              onClick={() => handlePrint(l.id)}
            >
              <TbDownload aria-hidden /> שמרו כ-PDF
            </button>
          </li>
        ))}
        {!progress.customTopic && (
          <li className={[styles.card, styles.cardEmpty].join(' ')}>
            <h3 className={styles.cardTitleEmpty}>השיעור האישי שלכם</h3>
            <p className={styles.cardMetaEmpty}>
              כדי לקבל גם את השיעור האישי כ-PDF — מלאו את טופס הכיתה בחלק 4.
            </p>
          </li>
        )}
      </ul>

      {host && currentLesson && createPortal(
        <div className={styles.printPage}>
          <header className={styles.printHeader}>
            <span className={styles.printTag}>BinAI · מטא-קוגניציה</span>
            <h1 className={styles.printTitle}>{currentLesson.titleHe}</h1>
            {currentLesson.classHe && (
              <p className={styles.printMeta}>{currentLesson.classHe}{currentLesson.topicHe ? ` · ${currentLesson.topicHe}` : ''}</p>
            )}
          </header>

          <LessonPlanCard
            titleHe="מערך השיעור"
            blocks={currentLesson.blocks}
            variant="print"
          />

          {currentLesson.notesHe && currentLesson.notesHe.trim().length > 0 && (
            <section className={styles.printNotes}>
              <h2 className={styles.printNotesTitle}>הערות שלי</h2>
              <pre className={styles.printNotesBody}>{currentLesson.notesHe}</pre>
            </section>
          )}

          <footer className={styles.printFooter}>
            BinAI · שיעור 6 · מטא-קוגניציה בכיתה
          </footer>
        </div>,
        host,
      )}
    </section>
  );
};

export default LessonPDFSet;
'@
Write-Source -Path 'src/sections/08-closing/PromptCardsPrintable.module.scss' -Body @'
.section {
  @include flex-col;
  gap: $space-3;
  margin-top: $space-5;
}

.eyebrow { @include eyebrow; }
.title   { @include headline-section; font-weight: $weight-light; }

.note {
  @include body-paragraph;
  font-size: $text-sm;
}

.btn {
  @include btn-primary;
  align-self: start;
  margin-top: $space-3;
  display: inline-flex;
  align-items: center;
  gap: $space-2;

  svg { font-size: 16px; }
}

.deck {
  font-family: $font-body;
  color: $ink;
  background: white;
}

.card {
  padding: 16mm 14mm;
  background: white;
  min-height: 100vh;
}

.cardHeader {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
  padding-bottom: 8pt;
  border-bottom: 1pt solid $line-strong;
  margin-bottom: 14pt;
}

.cardNum {
  font-family: $font-mono;
  font-size: 11pt;
  font-weight: 500;
  color: $accent;
  letter-spacing: 0.04em;
}

.cardKit {
  font-family: $font-mono;
  font-size: 8pt;
  color: $ink-faint;
  letter-spacing: 0.06em;
  text-transform: uppercase;
}

.cardName {
  font-family: $font-display;
  font-size: 26pt;
  font-weight: 400;
  color: $ink;
  line-height: 1.15;
  margin-bottom: 4pt;
}

.cardTag {
  font-family: $font-body;
  font-size: 11pt;
  font-style: italic;
  color: $ink-mid;
  margin-bottom: 12pt;
}

.cardWhen, .cardPrompt, .cardExample {
  margin-bottom: 12pt;

  h2 {
    font-family: $font-mono;
    font-size: 9pt;
    font-weight: 500;
    color: $accent;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    margin-bottom: 4pt;
  }

  p {
    font-family: $font-body;
    font-size: 10pt;
    line-height: 1.7;
    color: $ink;
    margin: 0;
  }
}

.cardPrompt {
  padding: 10pt 12pt;
  background: #F5F7FC;
  border-inline-start: 2pt solid $accent;
  border-radius: 2pt;
}

.partRow {
  display: grid;
  grid-template-columns: 50pt 1fr;
  gap: 8pt;
  margin-bottom: 6pt;

  &:last-child { margin-bottom: 0; }
}

.partLabel {
  font-family: $font-mono;
  font-size: 8pt;
  font-weight: 500;
  color: $accent;
  text-transform: uppercase;
  letter-spacing: 0.04em;
  padding-top: 2pt;
}

.cardExample p { font-style: italic; color: $ink-mid; }

.cardFooter {
  margin-top: 16pt;
  padding-top: 6pt;
  border-top: 1pt solid $line;
  font-family: $font-mono;
  font-size: 7pt;
  color: $ink-faint;
  letter-spacing: 0.04em;
  text-align: center;
}
'@
Write-Source -Path 'src/sections/08-closing/PromptCardsPrintable.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// PromptCardsPrintable — prints all 5 prompt cards as a single deck.
// One page per card via CSS page-break-after.
// ═══════════════════════════════════════════════════════════════════
import React, { useEffect, useState } from 'react';
import { createPortal } from 'react-dom';
import { TbDownload } from 'react-icons/tb';
import { PROMPT_CARDS } from '@/data/promptCards';
import styles from './PromptCardsPrintable.module.scss';

const PromptCardsPrintable: React.FC = () => {
  const [printing, setPrinting] = useState(false);
  const [host, setHost] = useState<HTMLElement | null>(null);

  useEffect(() => {
    let el = document.querySelector<HTMLElement>('.m06-print-host');
    if (!el) {
      el = document.createElement('div');
      el.className = 'm06-print-host';
      document.body.appendChild(el);
    }
    setHost(el);
  }, []);

  const handlePrint = () => {
    setPrinting(true);
    requestAnimationFrame(() => {
      window.print();
      setTimeout(() => setPrinting(false), 200);
    });
  };

  return (
    <section className={styles.section}>
      <span className={styles.eyebrow}>הקיט · 5 כרטיסיות פרומפט</span>
      <h2 className={styles.title}>הדק כרטיסיות הפרומפט — שיהיה תלוי במסך שלכם.</h2>
      <p className={styles.note}>
        חבילה אחת. 5 דפים. כדאי להדפיס דו-צדדי על דף A4 ולגזור — או לשמור כ-PDF
        ולחפש בו לפי מצב.
      </p>

      <button
        type="button"
        className={styles.btn}
        onClick={handlePrint}
      >
        <TbDownload aria-hidden /> שמרו את כל הכרטיסיות כ-PDF
      </button>

      {host && printing && createPortal(
        <div className={styles.deck}>
          {PROMPT_CARDS.map((c, i) => (
            <article
              key={c.id}
              className={styles.card}
              style={i < PROMPT_CARDS.length - 1 ? { pageBreakAfter: 'always' } : undefined}
            >
              <header className={styles.cardHeader}>
                <span className={styles.cardNum}>{c.number}</span>
                <span className={styles.cardKit}>BinAI · קיט מטא-קוגניציה</span>
              </header>

              <h1 className={styles.cardName}>{c.nameHe}</h1>
              <p className={styles.cardTag}>{c.taglineHe}</p>

              <section className={styles.cardWhen}>
                <h2>מתי</h2>
                <p>{c.whenToUseHe}</p>
              </section>

              <section className={styles.cardPrompt}>
                <h2>הפרומפט · 4 חלקים</h2>

                <div className={styles.partRow}>
                  <span className={styles.partLabel}>תפקיד</span>
                  <p>{c.roleHe}</p>
                </div>
                <div className={styles.partRow}>
                  <span className={styles.partLabel}>הקשר</span>
                  <p>{c.contextHe}</p>
                </div>
                <div className={styles.partRow}>
                  <span className={styles.partLabel}>משימה</span>
                  <p>{c.taskHe}</p>
                </div>
                <div className={styles.partRow}>
                  <span className={styles.partLabel}>מגבלות</span>
                  <p>{c.constraintsHe}</p>
                </div>
              </section>

              <section className={styles.cardExample}>
                <h2>דוגמה</h2>
                <p>{c.exampleHe}</p>
              </section>

              <footer className={styles.cardFooter}>
                BinAI · שיעור 6 · מטא-קוגניציה בכיתה · כרטיסייה {c.number} מתוך 05
              </footer>
            </article>
          ))}
        </div>,
        host,
      )}
    </section>
  );
};

export default PromptCardsPrintable;
'@
Write-Source -Path 'src/sections/08-closing/index.module.scss' -Body @'
.commit {
  @include flex-col;
  gap: $space-3;
  margin-top: $space-5;
  padding: $space-6;
  background: $bg-deep;
  color: $bg-canvas;
  border-radius: $radius-md;
}

.eyebrow {
  @include eyebrow;
  color: $accent;
}

.title {
  @include headline-section;
  color: $bg-canvas;
  font-weight: $weight-light;

  em {
    color: $accent;
    font-style: normal;
    text-decoration: underline;
    text-decoration-thickness: 1px;
    text-underline-offset: 4px;
  }
}

.lede {
  font-family: $font-body;
  font-size: $text-md;
  font-weight: $weight-light;
  line-height: $leading-loose;
  color: rgba(245, 246, 248, 0.75);
  max-width: $content-narrow;
}

.textarea {
  @include field-base;
  resize: vertical;
  min-height: 100px;
  background: rgba(245, 246, 248, 0.05);
  border-color: rgba(245, 246, 248, 0.18);
  color: $bg-canvas;
  line-height: $leading-loose;

  &::placeholder { color: rgba(245, 246, 248, 0.4); }
  &:focus {
    border-color: $accent;
    background: rgba(245, 246, 248, 0.08);
  }
}

.completeBtn {
  @include focus-ring;
  align-self: start;
  padding: 12px 32px;
  background: $accent;
  border: none;
  border-radius: $radius-md;
  color: $bg-canvas;
  font-family: $font-body;
  font-size: $text-base;
  font-weight: $weight-medium;
  cursor: pointer;
  transition: background $dur-fast $ease-out;

  &:hover:not(:disabled) { background: $accent-deep; }
  &:disabled {
    opacity: 0.35;
    cursor: not-allowed;
  }
}

.thanks {
  font-family: $font-body;
  font-size: $text-sm;
  color: rgba(245, 246, 248, 0.75);
  font-style: italic;
  margin-top: $space-2;
}
'@
Write-Source -Path 'src/sections/08-closing/index.tsx' -Body @'
// ═══════════════════════════════════════════════════════════════════
// Section 08 — סיכום (15 min)
// ═══════════════════════════════════════════════════════════════════
import React, { useEffect, useState } from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import { useProgressCtx } from '@/components/ModuleShell/ModuleProgressContext';
import ClosingHero from './ClosingHero';
import LessonPDFSet from './LessonPDFSet';
import PromptCardsPrintable from './PromptCardsPrintable';
import styles from './index.module.scss';

const KEY_COMMIT = 'binai.m06.commit.v1';

function loadCommit(): string {
  try { return localStorage.getItem(KEY_COMMIT) ?? ''; } catch { return ''; }
}
function saveCommit(value: string): void {
  try { localStorage.setItem(KEY_COMMIT, value); } catch { /* noop */ }
}

const ClosingSection: React.FC = () => {
  const { complete } = useProgressCtx();
  const [commit, setCommit] = useState<string>(() => loadCommit());
  const [done, setDone] = useState(false);

  useEffect(() => { saveCommit(commit); }, [commit]);

  const handleComplete = () => {
    complete('closing');
    setDone(true);
  };

  return (
    <SectionShell id="closing">
      <ClosingHero />
      <LessonPDFSet />
      <PromptCardsPrintable />

      <section className={styles.commit}>
        <span className={styles.eyebrow}>צעד אחד · השבוע</span>
        <h2 className={styles.title}>
          איזו <em>שאלה מטא-קוגניטיבית</em> תשאלו את הכיתה השבוע?
        </h2>
        <p className={styles.lede}>
          לא יחידה שלמה. שאלה אחת. בסוף שיעור אחד. שאלה שתגיד "אני רוצה לדעת
          איך הם חושבים, לא רק מה הם יודעים".
        </p>
        <textarea
          className={styles.textarea}
          value={commit}
          onChange={e => setCommit(e.target.value)}
          placeholder="ביום שלישי, בסוף שיעור היסטוריה של כיתה ז, אני אשאל..."
          rows={4}
        />

        <button
          type="button"
          className={styles.completeBtn}
          onClick={handleComplete}
          disabled={done || commit.trim().length < 10}
        >
          {done ? 'סומן כהושלם ✓' : 'סיימתי את ההשתלמות'}
        </button>

        {done && (
          <p className={styles.thanks}>
            תודה שלמדתם איתנו. השיעורים, הכרטיסיות, וההתחייבות שלכם — שמורים אצלכם.
            חזרו לכאן בכל זמן.
          </p>
        )}
      </section>
    </SectionShell>
  );
};

export default ClosingSection;
'@
Write-Source -Path 'src/styles/_mixins.scss' -Body @'
// ═══════════════════════════════════════════════════════════════════
// M06 · Quiet Minimal Mixins
// Few, deliberate. No "pop" tricks.
// ═══════════════════════════════════════════════════════════════════
@use "tokens" as *;

// ── LAYOUT HELPERS ─────────────────────────────────────────────
@mixin flex-row       { display: flex; flex-direction: row; }
@mixin flex-col       { display: flex; flex-direction: column; }
@mixin flex-center    { display: flex; align-items: center; justify-content: center; }
@mixin flex-start     { display: flex; align-items: center; justify-content: flex-start; }
@mixin flex-between   { display: flex; align-items: center; justify-content: space-between; }
@mixin flex-end       { display: flex; align-items: center; justify-content: flex-end; }

// ── CONTENT COLUMN ─────────────────────────────────────────────
// The editorial column. Narrow and centered.
@mixin column-narrow {
  max-width: $content-narrow;
  margin-inline: auto;
}

@mixin column-base {
  max-width: $content-base;
  margin-inline: auto;
}

@mixin column-wide {
  max-width: $content-wide;
  margin-inline: auto;
}

// ── TYPOGRAPHY ─────────────────────────────────────────────────
// Eyebrow: tiny monospace, very muted, letter-spaced.
@mixin eyebrow {
  font-family: $font-mono;
  font-size: $text-xs;
  font-weight: $weight-regular;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: $ink-faint;
}

// Section number — meta label
@mixin section-number {
  font-family: $font-mono;
  font-size: $text-sm;
  color: $ink-soft;
  letter-spacing: 0.04em;
}

// Headline — large, light weight
@mixin headline-hero {
  font-family: $font-display;
  font-weight: $weight-light;
  font-size: $text-3xl;
  line-height: $leading-tight;
  letter-spacing: -0.02em;
  color: $ink;

  @media (min-width: $bp-md) { font-size: $text-4xl; }
}

@mixin headline-section {
  font-family: $font-display;
  font-weight: $weight-light;
  font-size: $text-2xl;
  line-height: $leading-tight;
  letter-spacing: -0.015em;
  color: $ink;

  @media (min-width: $bp-md) { font-size: $text-3xl; }
}

@mixin headline-subsection {
  font-family: $font-display;
  font-weight: $weight-regular;
  font-size: $text-xl;
  line-height: $leading-tight;
  color: $ink;
}

// Body paragraph
@mixin body-paragraph {
  font-family: $font-body;
  font-weight: $weight-regular;
  font-size: $text-base;
  line-height: $leading-loose;
  color: $ink-mid;
}

// Lede (intro paragraph under a headline)
@mixin lede {
  font-family: $font-body;
  font-weight: $weight-light;
  font-size: $text-md;
  line-height: $leading-loose;
  color: $ink-mid;
}

// Pull quote (the workshop's voice)
@mixin pull-quote {
  font-family: $font-display;
  font-weight: $weight-light;
  font-size: $text-lg;
  line-height: $leading-body;
  color: $ink;
}

// ── ACCENT TREATMENTS ──────────────────────────────────────────
// Single underline accent — DOTTED in M06, signaling annotation/marginalia.
@mixin accent-underline {
  color: $accent;
  border-bottom: 1px dotted $accent;
  padding-bottom: 1px;
}

// Tiny accent rule — dotted divider with breathing room.
@mixin micro-rule($w: 56px) {
  width: $w;
  height: 0;
  background: transparent;
  border: none;
  border-top: 1px dotted $accent;
  margin: 0;
}

// ── BUTTONS ────────────────────────────────────────────────────
// Primary — solid navy, used for the main forward action only.
@mixin btn-primary {
  font-family: $font-body;
  font-weight: $weight-regular;
  font-size: $text-sm;
  padding: 10px 28px;
  background: $ink;
  color: $bg-canvas;
  border: 1px solid $ink;
  border-radius: $radius-pill;
  cursor: pointer;
  transition: background $dur-fast $ease-out;

  &:hover:not(:disabled) { background: $bg-deep; }
  &:disabled { opacity: 0.4; cursor: not-allowed; }
}

// Secondary — outline, used for back / cancel.
@mixin btn-secondary {
  font-family: $font-body;
  font-weight: $weight-regular;
  font-size: $text-sm;
  padding: 10px 24px;
  background: transparent;
  color: $ink-mid;
  border: 1px solid $line-strong;
  border-radius: $radius-pill;
  cursor: pointer;
  transition: all $dur-fast $ease-out;

  &:hover { border-color: $ink; color: $ink; }
  &:disabled { opacity: 0.4; cursor: not-allowed; }
}

// Quiet — text-only link
@mixin btn-link {
  background: none;
  border: none;
  padding: 0;
  font-family: $font-body;
  font-size: $text-sm;
  color: $accent;
  text-decoration: underline;
  cursor: pointer;

  &:hover { color: $accent-deep; }
}

// ── INPUTS ─────────────────────────────────────────────────────
@mixin field-base {
  font-family: $font-body;
  font-size: $text-base;
  line-height: $leading-body;
  color: $ink;
  background: $bg-surface;
  border: 1px solid $line;
  border-radius: $radius-md;
  padding: 10px 14px;
  transition: border-color $dur-fast $ease-out;

  &::placeholder { color: $ink-soft; font-weight: $weight-light; }

  &:focus {
    outline: none;
    border-color: $ink;
  }
}

// ── FOCUS ──────────────────────────────────────────────────────
@mixin focus-ring {
  &:focus-visible {
    outline: 2px solid $accent;
    outline-offset: 2px;
    border-radius: $radius-sm;
  }
}

// ── RESPONSIVE ─────────────────────────────────────────────────
@mixin respond-to($bp) {
  @if $bp == sm { @media (min-width: $bp-sm) { @content; } }
  @else if $bp == md { @media (min-width: $bp-md) { @content; } }
  @else if $bp == lg { @media (min-width: $bp-lg) { @content; } }
  @else if $bp == xl { @media (min-width: $bp-xl) { @content; } }
}
'@
Write-Source -Path 'src/styles/_tokens.scss' -Body @'
// ═══════════════════════════════════════════════════════════════════
// M06 · Scholarly Journal Design Tokens
// Hebrew serif headlines (Frank Ruhl Libre) + Heebo body.
// Dotted dividers throughout — the "reflective" hint.
// Cool pale paper. Restrained. Marginalia-friendly.
// ═══════════════════════════════════════════════════════════════════

// ── PALETTE ────────────────────────────────────────────────────
$bg-canvas:        #F5F6F8;
$bg-surface:       #FFFFFF;
$bg-subtle:        #ECEEF3;
$bg-deep:          #1A2332;

$ink:              #1A2332;
$ink-mid:          #4A4F5C;
$ink-soft:         #6E727F;
$ink-faint:        #99989C;

$line:             #D0D5E0;
$line-soft:        rgba(26, 35, 50, 0.10);
$line-strong:      rgba(26, 35, 50, 0.22);

$accent:           #1F4B9F;
$accent-deep:      #163873;
$accent-soft:      rgba(31, 75, 159, 0.10);
$accent-faint:     rgba(31, 75, 159, 0.04);

$success:          #4A8F3F;
$success-soft:     rgba(74, 143, 63, 0.08);

// ── TYPOGRAPHY ─────────────────────────────────────────────────
// Hebrew serif for display (Frank Ruhl Libre — the scholarly choice).
// Heebo carries body. IBM Plex Mono stays for monospaced tags.
$font-display:     'Frank Ruhl Libre', 'Heebo', system-ui, serif;
$font-body:        'Heebo', system-ui, sans-serif;
$font-mono:        'IBM Plex Mono', ui-monospace, monospace;

$weight-light:     300;
$weight-regular:   400;
$weight-medium:    500;

$text-xs:          12px;
$text-sm:          14px;
$text-base:        15px;
$text-md:          17px;
$text-lg:          20px;
$text-xl:          26px;
$text-2xl:         32px;
$text-3xl:         42px;
$text-4xl:         56px;

$leading-tight:    1.15;
$leading-body:     1.6;
$leading-loose:    1.75;

// ── SPACING ────────────────────────────────────────────────────
$space-0:          0;
$space-1:          4px;
$space-2:          8px;
$space-3:          12px;
$space-4:          16px;
$space-5:          24px;
$space-6:          32px;
$space-7:          48px;
$space-8:          64px;
$space-9:          96px;
$space-10:         128px;

// ── SHAPES ─────────────────────────────────────────────────────
$radius-sm:        4px;
$radius-md:        6px;
$radius-lg:        8px;
$radius-pill:      999px;

// ── BORDERS ────────────────────────────────────────────────────
// All dividers use DOTTED treatment in M06 — the "reflective" signature.
$border-hair:      1px dotted $line-strong;
$border-subtle:    1px dotted $line;

// ── SHADOWS ────────────────────────────────────────────────────
$shadow-none:      none;
$shadow-hairline:  0 1px 0 rgba(26, 35, 50, 0.04);
$shadow-card:      0 1px 2px rgba(26, 35, 50, 0.04);

// ── MOTION ─────────────────────────────────────────────────────
$dur-fast:         0.15s;
$dur-base:         0.25s;
$dur-slow:         0.45s;

$ease-out:         cubic-bezier(0.22, 1, 0.36, 1);
$ease-in-out:      cubic-bezier(0.65, 0, 0.35, 1);

// ── BREAKPOINTS ────────────────────────────────────────────────
$bp-sm:            480px;
$bp-md:            768px;
$bp-lg:            1024px;
$bp-xl:            1280px;

// ── LAYOUT WIDTHS ──────────────────────────────────────────────
// Narrow editorial column. Workshop book reads narrow.
$content-narrow:   620px;
$content-base:     720px;
$content-wide:     880px;
'@
Write-Source -Path 'src/styles/global.scss' -Body @'
// ═══════════════════════════════════════════════════════════════════
// M06 · Global Styles
// Quiet Minimal · embedded in BinAI iframe (no own header)
// ═══════════════════════════════════════════════════════════════════
@use "tokens" as *;
@use "mixins" as *;

*, *::before, *::after { box-sizing: border-box; }

html { -webkit-text-size-adjust: 100%; }

body {
  margin: 0;
  font-family: $font-body;
  font-size: $text-base;
  font-weight: $weight-regular;
  line-height: $leading-body;
  color: $ink-mid;
  background: $bg-canvas;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
}

a { color: $accent; text-decoration: underline; text-underline-offset: 2px; }
a:hover { color: $accent-deep; }

h1, h2, h3, h4, h5, h6 { margin: 0; font-weight: $weight-light; color: $ink; }
p { margin: 0; }
ul, ol { margin: 0; padding-inline-start: 1.25em; }
button { font-family: inherit; }
input, textarea, select { font-family: inherit; }

::selection { background: $accent-soft; color: $ink; }

#root { min-height: 100vh; display: flex; flex-direction: column; }

// ═══════════════════════════════════════════════════════════════
// PRINT — Section 8 uses a React portal mounted to <body>.
// In print we hide #root entirely and show only the portal.
// ═══════════════════════════════════════════════════════════════
@page { size: A4; margin: 20mm 18mm; }

.m06-print-host { display: none; }

@media print {
  body {
    background: white !important;
    color: black !important;
    margin: 0 !important;
    padding: 0 !important;
    -webkit-print-color-adjust: exact;
    print-color-adjust: exact;
  }
  #root { display: none !important; }
  .m06-print-host {
    display: block !important;
    margin: 0;
    padding: 0;
    width: 100%;
  }
  .m06-print-field {
    page-break-inside: avoid;
    break-inside: avoid;
  }
  a[href]::after { content: '' !important; }
}
'@
Write-Source -Path 'src/types/module.types.ts' -Body @'
// ═══════════════════════════════════════════════════════════════════
// M06 · Type definitions
// ═══════════════════════════════════════════════════════════════════

export type SectionId =
  | 'opening'
  | 'thinkaloud'
  | 'frameworks'
  | 'break'
  | 'ai'
  | 'methods'
  | 'personal'
  | 'closing';

export interface SectionMeta {
  id:          SectionId;
  number:      number;
  path:        string;
  shortHe:     string;
  titleHe:     string;
  subtitleHe:  string;
  minutes:     number;
}

/** The 3 metacognitive methods the workshop teaches */
export type TechniqueKey = 'kwl' | 'thinkaloud' | 'exit';

/** Age tier for the teacher's own class (used in Break section) */
export type AgeTier = 'elementary' | 'middle' | 'high';

export interface CustomTopic {
  subject:  string;
  grade:    string;
  ageTier:  AgeTier;
  topic:    string;
  context?: string;
}

export interface SectionProgress {
  visited:     boolean;
  completed:   boolean;
  completedAt: number | null;
}

export interface ModuleProgress {
  sections:           Record<SectionId, SectionProgress>;
  customTopic:        CustomTopic | null;
  personalTechnique:  TechniqueKey | null;
}
'@
Write-Source -Path 'src/vite-env.d.ts' -Body @'
/// <reference types="vite/client" />

declare module '*.module.scss' {
  const classes: { readonly [key: string]: string };
  export default classes;
}

declare module '*.module.css' {
  const classes: { readonly [key: string]: string };
  export default classes;
}

declare module '*.scss';
declare module '*.css';
'@
Write-Source -Path 'tsconfig.app.json' -Body @'
{
  "compilerOptions": {
    "target": "ES2022",
    "useDefineForClassFields": true,
    "lib": ["ES2022", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "isolatedModules": true,
    "moduleDetection": "force",
    "noEmit": true,
    "jsx": "react-jsx",
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "noUncheckedSideEffectImports": true,
    "baseUrl": ".",
    "paths": { "@/*": ["src/*"] }
  },
  "include": ["src"]
}
'@
Write-Source -Path 'tsconfig.json' -Body @'
{
  "files": [],
  "references": [
    { "path": "./tsconfig.app.json" },
    { "path": "./tsconfig.node.json" }
  ]
}
'@
Write-Source -Path 'tsconfig.node.json' -Body @'
{
  "compilerOptions": {
    "target": "ES2022",
    "lib": ["ES2023"],
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "isolatedModules": true,
    "moduleDetection": "force",
    "noEmit": true,
    "types": ["node"],
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true
  },
  "include": ["vite.config.ts"]
}
'@
Write-Source -Path 'vite.config.ts' -Body @'
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'node:path';

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: { '@': path.resolve(__dirname, './src') },
  },
  css: {
    preprocessorOptions: {
      scss: {
        api: 'modern',
        additionalData: `@use "@/styles/_tokens" as *; @use "@/styles/_mixins" as *;`,
      },
    },
  },
});
'@

Write-Host ""
Write-Host "Done. Run: npm install, then npm run dev" -ForegroundColor Green
Write-Host ""

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
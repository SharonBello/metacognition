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
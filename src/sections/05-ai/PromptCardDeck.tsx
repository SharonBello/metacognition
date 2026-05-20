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